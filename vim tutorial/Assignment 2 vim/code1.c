#include <stdio.h>
#define N 10000
main()
{ int i, j, p, q, id[N], sz[N];
for (i = 0; i < N; i++)
{ id[i] = i; sz[i] = 1; }
while (scanf("%d %d\n", &p, &q) == 2)
{ 
for (i = p; i != id[i]; i = id[i]) ;
for (j = q; j != id[j]; j = id[j]) ;
if (i == j) continue;
if (sz[i] < sz[j])
{ id[i] = j; sz[j] += sz[i]; }
else { id[j] = i; sz[i] += sz[j]; }
printf(" %d %d\n", p, q);
}
}

float randFloat()
{ return 1.0*rand()/RAND_MAX; }
main(int argc, char *argv[])
{ float d = atof(argv[2]);
int i, j, cnt = 0, N = atoi(argv[1]);
point *a = malloc(N*(sizeof(*a)));
for (i = 0; i < N; i++)
{ a[i].x = randFloat(); a[i].y = randFloat(); }
for (i = 0; i < N; i++)
for (j = i+1; j < N; j++)
if (distance(a[i], a[j]) < d) cnt++;
printf("%d edges shorter than %f\n", cnt, d);
}


/* This function is equivalent to iscntrl() for multibyte characters,
 * except in that it also handles multibyte control characters with
 * their high bits set. */
bool is_cntrl_mbchar(const char *c)
{
    assert(c != NULL);

#ifdef ENABLE_UTF8
    if (use_utf8) {
	wchar_t wc;

	if (mbtowc(&wc, c, MB_CUR_MAX) < 0) {
	    mbtowc_reset();
	    wc = bad_wchar;
	}

	return is_cntrl_wchar(wc);
    } else
#endif
	return is_cntrl_char((unsigned char)*c);
}

/* This function is equivalent to ispunct() for multibyte characters. */
bool is_punct_mbchar(const char *c)
{
    assert(c != NULL);

#ifdef ENABLE_UTF8
    if (use_utf8) {
	wchar_t wc;
	int c_mb_len = mbtowc(&wc, c, MB_CUR_MAX);

	if (c_mb_len < 0) {
	    mbtowc_reset();
	    wc = bad_wchar;
	}

	return iswpunct(wc);
    } else
#endif
	return ispunct((unsigned char)*c);
}


bool sort()
{
    assert(c != NULL);

    return is_alnum_mbchar(c) || (allow_punct ? is_punct_mbchar(c) :
	FALSE);
}



/* c is a multibyte non-control character.  We return that multibyte
 * character.  If crep is an invalid multibyte sequence, it will be
 * replaced with Unicode 0xFFFD (Replacement Character). */
char *mbrep(const char *c, char *crep, int *crep_len)
{
    assert(c != NULL && crep != NULL && crep_len != NULL);

#ifdef ENABLE_UTF8
    if (use_utf8) {
	wchar_t wc;

	/* Reject invalid Unicode characters. */
	if (mbtowc(&wc, c, MB_CUR_MAX) < 0 || !is_valid_unicode(wc)) {
	    mbtowc_reset();
	    *crep_len = bad_mbchar_len;
	    strncpy(crep, bad_mbchar, *crep_len);
	} else {
	    *crep_len = wctomb(crep, wc);

	    if (*crep_len < 0) {
		wctomb_reset();
		*crep_len = 0;
	    }
	}
    } else {
#endif
	*crep_len = 1;
	*crep = *c;
#ifdef ENABLE_UTF8
    }
#endif

    return crep;
}

/* This function is equivalent to wcwidth() for multibyte characters. */
int mbwidth(const char *c)
{
    assert(c != NULL);

#ifdef ENABLE_UTF8
    if (use_utf8) {
	wchar_t wc;
	int width;

	if (mbtowc(&wc, c, MB_CUR_MAX) < 0) {
	    mbtowc_reset();
	    wc = bad_wchar;
	}

	width = wcwidth(wc);

	if (width == -1) {
	    wc = bad_wchar;
	    width = wcwidth(wc);
	}

	return width;
    } else
#endif
	return 1;
}

/* Return the maximum width in bytes of a multibyte character. */
int mb_cur_max(void)
{
    return
#ifdef ENABLE_UTF8
	use_utf8 ? MB_CUR_MAX :
#endif
	1;
}