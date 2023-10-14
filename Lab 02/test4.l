
Name [A-Z][a-z]*
Roll ^1907(0[0-9][0-9]|1[0-1][0-9]|12[0-1])$
Digit [0-9]


%%
{Name}	{printf("%s is a Name.\n",yytext);}
{Roll}  {printf("%d is a Roll.\n",atoi(yytext));}
[0-9]+	{printf("%d Roll is not valid.\n",atoi(yytext));}
.	{printf("%s! I don't recognize it.\n");}
%%

int yywrap(){
	return 1;
}

int main(){
	yyin=fopen("text.txt","r");
	yylex();
	return 0;
}