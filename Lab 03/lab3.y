%{
	#include <stdio.h>
	#include <stdlib.h>
	#define YYSTYPE double
	#include <math.h>
int yyerror(char *s);
int yylex();
%}

%token NUMBER PLUS MINUS GUN VAG NEWLINE LP RP
%left PLUS MINUS
%left GUN VAG
%right EXPONENT

%%
start:/* empty */
	|start line
	; 

line: NEWLINE
	exp NEWLINE{printf("\t%.1eg\n",$1);}
	;
exp:exp PLUS term	{$$=$1+$3;}
	|exp MINUS term {$$=$1-$3;}
	|term {$$=$1;}
	;
term:term GUN factor	{$$=$1*$3;}
	|term VAG factor{$$=$1/$3;}
	|factor{$$=$1;}	{$$=$2;}
	;
factor:LP exp RP	{$$=$2;}
	|NUMBER		{$$=$1;}
	;	
%%
int yyerror(char *s){
	printf("%s",s);
	return 0;
}

int main(){
	yyparse();
	return 0;
}