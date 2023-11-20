/*bison flex different file*/

/* C Declarations */

%{
	#include "odd.tab.h"
	extern int yylval;
%}

/*RE and Action*/

%%

[0-9]*	{
		yylval = atoi(yytext); 

		if(yylval%2 == 0)
		{
			return EVEN;
		}
		else
		{
			return ODD;
		}
	}
%%

/* user subroutines */

int yywrap(void)
{
	return 1;
}


