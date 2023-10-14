%{
#include<string.h>
char s[10000];
int count=0,flag=0,gotVariable=0;
%}


%%
.+	{
		strcpy(s,yytext);
		for(int i=0;i<strlen(s);i++){
			if((i+4<strlen(s) &&  s[i]=='f' && s[i+1]=='l' && s[i+2]=='o' && s[i+3]=='a' && s[i+4]=='t') || (i+2<strlen(s) && s[i]=='i' && s[i+1]=='n' && s[i+2]=='t')){
				flag=1;
				printf("detected\n");
			}
			else if(flag==1 && s[i]==' '){
				gotVariable=1;
			}
			else if(gotVariable==1 && (s[i]==',' || s[i]==';')){
				count++;
				if(s[i]==';') gotVariable=0;
			}
		}
	}
\n
%%

int yywrap(){
	return 1;
}

int main(){
	yyin=fopen("text.txt","r");
	yylex();
	printf("The number of variable is: %d\n",count);
	return 0;
}