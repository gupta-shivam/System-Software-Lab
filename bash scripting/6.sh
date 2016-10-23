awk -F'#' '
{
	print "\n\n\nRoll No : " $2 "\n------------------------------------------------";
	printf("PART \t\t\t\t Correct\tMarks\n");
	Most_Basic=0;
	for ( i = 3; i <= 16; i++ )
	{
		if( $i == 1 )
		{
			Most_Basic++;		
		}
	}
	Basic_Linux=0;
	for ( i = 17; i <= 26; i++ )
	{
		if( $i == 1 )
		{
			Basic_Linux++;		
		}
	}
	Advanced_Linux=0;
	for ( i = 27; i <= 36; i++ )
	{
		if( $i == 1 )
		{
			Advanced_Linux++;		
		}
	}
	Basic_Vim=0;
	for ( i = 37; i <= 49; i++ )
	{
		if( $i == 1 )
		{
			Basic_Vim++;		
		}
	}
	Advanced_Vim=0;
	for ( i = 50; i <= 58; i++ )
	{
		if( $i == 1 )
		{
			Most_Basic++;		
		}
	}
	Total = Advanced_Vim+Basic_Vim+Advanced_Linux+Basic_Linux+Most_Basic;
	TotalMarks = 3*Advanced_Vim+Basic_Vim+3*Advanced_Linux+2*Basic_Linux+Most_Basic;
	printf("Most basic Commands \t\t %d \t\t %d\n",Most_Basic,Most_Basic);
	printf("Basic Linux Commands \t\t %d \t\t %d\n",Basic_Linux,2*Basic_Linux);
	printf("Advanced Linux Commands \t %d \t\t %d\n",Advanced_Linux,3*Advanced_Linux);
	printf("Basic VIM Commands. \t\t %d \t\t %d\n",Basic_Vim,Basic_Vim);
	printf("Advanced VIM \t\t\t %d \t\t %d\n",Advanced_Vim,3*Advanced_Vim);
	printf("Total \t\t\t\t %d \t\t %d\n",Total,TotalMarks);
}' marks.csv | more
