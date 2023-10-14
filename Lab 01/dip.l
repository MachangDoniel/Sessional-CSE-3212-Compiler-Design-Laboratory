%%
[#][0-9]+[/][A-Z][,].*[,][a-zA-Z]+[ ]*[a-zA-Z]+[a-zA-Z]+[-][0-9]* {printf("Found\n");}
.* {printf("Not Found\n");}
%%

int yywrap()
{
return 1;
}

int main()
{
printf("Address recognization\n");
yylex();

}