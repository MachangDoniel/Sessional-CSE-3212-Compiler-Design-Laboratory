		int n_word=0, n_line=1, n_char=0;

%%

\n {n_line++; n_char++;}
[^ \n\t]+ {n_word++; n_char+=yyleng;}
[ \t] {n_char++;}

%%

int yywrap()
{
	return 1;
}

int main()
{	
	yyin = fopen("input.txt", "r");
	yylex();
	printf("Number of word: %d\n", n_word);
	printf("Number of line: %d\n", n_line);
	printf("Number of char: %d\n", n_char);
	return 0;
}