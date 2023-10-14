%{
#include<string.h>
char s[10000];
int zero=0,one=0;
%}


%%
[01]+	{
		strcpy(s,yytext);
		for(int i=0;i<strlen(s);i++){
			if(s[i]=='0') zero++;
			else one++;
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
	printf("%d %d\n",one,zero);
	return 0;
}