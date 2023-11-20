
%%
[A-Z][a-z]*[ ][A-Z][/][A-Z][,][ ][A-Z]*[-][0-9]+ {printf("Address: %s\n", yytext);}
.
\n
%%

int yywrap()
{
	return 1;
}

int main()
{
	yyin = fopen("address.txt", "r");
	yylex();
	return 0;
}