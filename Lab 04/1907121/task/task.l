%{
	#include<stdio.h>
	#include "task.tab.h"
	#include<stdlib.h>
	#include<string.h>
%}


%%
[a-zA-Z][a-zA-Z0-9]* {
	if(strcmp(strdup(yytext),"int")==0 || strcmp(strdup(yytext),"float")==0){
		yylval.type = strdup(yytext);
	}
      	else yylval.stringValue = strdup(yytext);
	return IDENTIFIER;
}

[0-9]+ {
	yylval.intValue = atoi(yytext);
	return INTEGER;
}

[0-9]*\.[0-9]+"f"? {
	yylval.floatValue = atof(yytext);
	return FLOAT;
}

[ \t\n]*

.	{yyerror("Unknown Character.\n");}
%%