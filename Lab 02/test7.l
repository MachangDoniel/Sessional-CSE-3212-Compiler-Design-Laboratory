%{
#include<string.h>
char s[10000];
int count=0;
%}


%%
[0-9]+	{
		strcpy(s,yytext);
		for(int i=5;i<strlen(s);i++){
			if(s[i-5]=='1' && s[i-4]=='1' && s[i-3]=='0' && s[i-2]=='1' && s[i-1]=='0' && s[i]=='0') 				count++;
		}
	}
.
%%

int yywrap(){
	return 1;
}

int main(){
	yyin=fopen("text.txt","r");
	yylex();
	printf("The pattern matched %d times\n",count);
	return 0;
}