
#include "proto.h"

#include <string.h>
#include <ctype.h>

#ifdef ENABLE_UTF8
#ifdef HAVE_WCHAR_H
#include <wchar.h>
#endif
#ifdef HAVE_WCTYPE_H
#include <wctype.h>
#endif
 
static bool use_utf8 = FALSE;
	/* Whether we've enabled UTF-8 support. */
static const wchar_t bad_wchar = 0xFFFD;
	/* If we get an invalid multibyte sequence, we treat it as
	 * Unicode FFFD (Replacement Character), unless we're searching
	 * for a match to it. */
static const char *const bad_mbchar = "\xEF\xBF\xBD";
static const int bad_mbchar_len = 3;

//This is a comment

/* Enable UTF-8 support. */
void utf8_init(void)
{

//This is a comment Initialize
    use_utf8 = TRUE;  //This is a comment for this line
}

/* Is UTF-8 support enabled? */
bool using_utf8(void)
{
    return use_utf8;
}
#endif

#ifndef HAVE_ISBLANK
/* This function is equivalent to isblank(). */
bool nisblank(int c)
{
    return isspace(c) && (c == '\t' || !is_cntrl_char(c));
}
#endif

#if !defined(HAVE_ISWBLANK) && defined(ENABLE_UTF8)
/* This function is equivalent to iswblank(). */
bool niswblank(wchar_t wc)
{
    return iswspace(wc) && (wc == '\t' || !is_cntrl_wchar(wc));
}
#endif

/* Return TRUE if the value of c is in byte range, and FALSE
 * otherwise. */
bool is_byte(int c)
{
    return ((unsigned int)c == (unsigned char)c); //This is a comment
}

static void mbtowc_reset(void)
{
    IGNORE_CALL_RESULT(mbtowc(NULL, NULL, 0));
}

static void wctomb_reset(void)
{
    IGNORE_CALL_RESULT(wctomb(NULL, 0));
}

/* This function is equivalent to isalnum() for multibyte characters. */
bool is_alnum_mbchar(const char *c)
{
    assert(c != NULL);

#ifdef ENABLE_UTF8
    if (use_utf8) {
	wchar_t wc;

	if (mbtowc(&wc, c, MB_CUR_MAX) < 0) {
	    mbtowc_reset();
	    wc = bad_wchar;
	}

	return iswalnum(wc);
    } else
#endif
	return isalnum((unsigned char)*c);
}

/* This function is equivalent to isblank() for multibyte characters. */
bool is_blank_mbchar(const char *c)
{
    assert(c != NULL);

#ifdef ENABLE_UTF8
    if (use_utf8) {
	wchar_t wc;

	if (mbtowc(&wc, c, MB_CUR_MAX) < 0) {
	    mbtowc_reset();
	    wc = bad_wchar;
	}

	return iswblank(wc);
    } else
#endif
	return isblank((unsigned char)*c);
}