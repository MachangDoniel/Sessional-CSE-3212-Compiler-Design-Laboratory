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
	char *type;	
};

start:
	| start input
	;
input: IDENTIFIER {}
	;
input: INTEGER printf("\n variable %s is and its value is %d \n",yylval.stringValue,yylval.floatValue);}
	;
input: FLOAT {printf("\n variable %s is %s and its value is %d \n",yylval.stringValue,yylval.type,yylval.floatValue);}
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