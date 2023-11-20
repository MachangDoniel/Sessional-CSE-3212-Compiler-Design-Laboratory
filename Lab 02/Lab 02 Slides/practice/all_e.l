%{
	/* need this for the call to atof() below */
	#include <math.h>
        int var=0;
%}

DIGIT	[0-9]
ID	[a-z][a-z0-9]*

%%

{DIGIT}+	{
				printf( "An integer: %s (%d)\n", yytext,atoi( yytext ) );
			}
{DIGIT}+"."{DIGIT}*		{
							printf( "A float: %s (%g)\n", yytext,atof( yytext ) );
						}
if|then|begin|end|procedure|function|return|int	{											printf( "A keyword: %s\n", yytext );
										}
("int"|"float"|"char")" "+{ID}(","{ID})*		{ ++var;
				printf( "An identifier: %s\n", yytext );
			}

"+"|"-"|"*"|"/"		{
						printf( "An operator: %s\n", yytext );
					}
"{"[^}\n]*"}" /* eat up one-line comments */

[ \t\n]+ /* eat up whitespace */

. 

%%

int yywrap()
{
	return 1;
}

int main()
{
	yyin = fopen("input.c","r");
	yylex();
	printf("number of variables %d\n",var);
	yyout = fopen("output.txt","w");
        
	return 0;
}

