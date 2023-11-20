%{
// Write a flex program to count no of variable declared & any variable is declared twice or more(duplicate)
#include <bits/stdc++.h>
using namespace std;

map<string, int> mp;
char var[100];
void check(string variable) {
    if (mp[variable]) cout << "variable " << variable << " is already declared" << endl;
    else cout << "variable " << variable << " is declared" << endl;
    mp[variable]++;
}
%}

%%
"int "[a-zA-Z][a-zA-Z0-9]*        { sscanf(yytext + 4, "%s", var); check(var); }
"float "[a-zA-Z][a-zA-Z0-9]*      { sscanf(yytext + 6, "%s", var); check(var); }
","[a-zA-Z][a-zA-Z0-9]*          { sscanf(yytext + 1, "%s", var); check(var); }
.                                {}
%%

int yywrap() {
    return 1;
}

int main() {
    yyin = fopen("input3.txt", "r");
    yylex();
    cout << "Number of variables: " << mp.size() << endl;
    return 0;
}
