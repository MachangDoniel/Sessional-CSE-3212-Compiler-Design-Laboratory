

%%
.+	{printf("%s\n", yytext);}
\n
%%
int yywrap()
{
	return 1;
}
int main()
{
            yyin = fopen( "lex.yy.c", "r" );	    
	yylex();
	return 0;
}