%%
.  {printf("character\n");}
%%

int yywrap(){
return 1;
}

main(){
printf("My First FLEX program\n");

yylex();

}