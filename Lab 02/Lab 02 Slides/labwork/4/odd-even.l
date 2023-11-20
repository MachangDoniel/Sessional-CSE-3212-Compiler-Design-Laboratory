%{ 
#include <string.h>

char s[10000];
int i, zero, one;
%}

%%

[01]+	{
			strcpy(s,yytext);
			zero=0;
			one=0;
			for(i=0; i<strlen(s); i++)
			{
				if(s[i]=='0')
					zero++;
				if(s[i]=='1')
					one++;
			}
			if(zero%2==1 && one%2==0)
				printf("Match\n");
			else
				printf("Not match\n");
		}
.
\n

%%

int yywrap()
{
	return 1;
}

int main()
{
	yylex();
	return 0;
}