%%
[0-9]  {printf("Number\n");}
[a-z]  {printf("Small Letter\n");}
[A-Z]	{printf("Capital Letter\n");}
.	{printf("Unknown Letter\n");}
%%

int yywrap(){
return 1;
}

void main(){
printf("Enter Character\n");

yylex();
return;
}