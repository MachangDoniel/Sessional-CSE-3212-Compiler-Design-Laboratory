/*bison flex different file*/

/* C Declarations */

%{
	#include <stdio.h>
	#include "id.tab.h"	/* header for token defination */
	//int yyparse();
%}

ID	[a-zA-z][a-zA-z0-9_]*


/*RE and Action*/

%%

[ \t]+	
"int"	return(INT);
"char"	return(CHAR);
"float"	return(FLOAT);          
{ID}	return(ID);
[,;]	return(*yytext);	
.	{ printf("\nunknown character"); }
%%

/* user subroutines */



int yywrap()
{
	return 1;
}

void yyerror (char const *s)
{
	fprintf (stderr, "%s\n", s);
}
int main()
{
	printf("Declaration : ");
	//yyin = fopen("a.txt","r");
	yyparse();
	return 0;
}
