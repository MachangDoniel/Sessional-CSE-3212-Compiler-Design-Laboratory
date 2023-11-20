newline   [\n]
%%
[/][*].+{newline}+?[*][/] {printf("Multiline comment\n");}
[/][/].* {printf("Single comment: %s\n", yytext);}
.
\n
%%

int yywrap()
{
	return 1;
}

int main()
{
	yyin = fopen("comment.txt", "r");
	yylex();
	return 0;
}