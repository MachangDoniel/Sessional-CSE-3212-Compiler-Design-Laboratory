%%
[a-z]+[A-Z]+[0-9] {printf("Found");}

%%

int yywrap()
{
return 1;
}

int main()
{
printf("ID recognization");
yylex();

}