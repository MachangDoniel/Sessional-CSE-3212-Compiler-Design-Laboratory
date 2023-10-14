
Digit [0-9]
Id [a-z][a-z0-9]*


%%
{Digit}+	{printf("An integer: %s (%d)",yytext,atoi(yytext));}
{Digit}+"."{Digit}*	{printf("A Float: %s (%d)",yytext,atof(yytext));}
%%

int yywrap(){
	return 1;
}

int main(){
	yyin=fopen("text.txt","r");
	yylex();
	return 0;
}