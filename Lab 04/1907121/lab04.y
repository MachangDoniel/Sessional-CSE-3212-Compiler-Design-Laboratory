%{
	#include<stdio.h>
%}

%token IDENTIFIER INTEGER FLOAT

/* Grammer rules and actions
folow. */

%%

%union
{
	int intValue;
	float floatValue;
	char *stringValue;	
};

start:
	| start input
	;
input: FLOAT {printf("\nfloat Value:%.2f \n",yylval.floatValue);}
	;

%%

int yywrap() 
{
	return 1;
}

int main()
{
	yyparse();
}

yyerror(char *s)
{
	printf("%s\n",s);
}