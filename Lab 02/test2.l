%{
int num_lines=0, num_chars=0;
%}

%%
\n	{++num_lines; ++num_chars;}
.	{++num_chars;}
%%

int yywrap(){
	return 1;
}

int main(){
	yyin=fopen("lex.yy.c","r");
	yylex();
	printf("No of Line: %d\n",num_lines);
	printf("No of Character: %d\n",num_chars);
	return 0;
}