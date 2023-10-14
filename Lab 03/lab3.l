%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <math.h>
	#include "lab3.tab.h"
	//extern YYSTYPE yyval;

%}

%option noyywrap

delim [ \t]
white {delim}+
num [0-9]
number {num}*[.]?{num}+

%%
{number}	{sscanf(yytext,"%lf",&yylval);
		return NUMBER;}
"+"		{return PLUS;}
"-"		{return MINUS;}
"*"		{return GUN;}
"/"		{return VAG;}
"("		{return LP;}
")"		{return RP;}
"\n"		{return NEWLINE;}
{white}		{}
%%
