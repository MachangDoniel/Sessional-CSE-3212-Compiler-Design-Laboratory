%{
	#include<bits/stdc++.h>
	using namespace std;
    int variable=0,keyword=0,statement=0;
    map<string,int>mp;
    bool variableInitializeCheckflag=false;
%}

/* Macro:  */
ID 								[a-zA-Z][a-zA-Z0-9]*
STRING 							[a-zA-Z]
DIGIT 							[0-9]
HEADER							"TW"[ ]++[^\n]+[.h][\n]

/* Library:  */
/* Data Type Keywords:  */
/* Control Flow Keywords:  */
/* Storage Class Keywords:  */
/* OTHER Keywords:  */
/* Arithmetic Operators:  */
/* Comparison Operators:  */
/* Logical Operators:  */
/* Assignment Operators:  */
/* Increment and Decrement Operators:  */
/* Bitwise Operators:  */

%%

{HEADER}						{ printf("IMPORT HEADER\n"); }
"MAIN"         				    { printf("MAIN\n"); }

"REM"          				    { printf("DATA_TYPE_INT\n");  variableInitializeCheckflag=true; keyword++;}
"SUK"          				    { printf("DATA_TYPE_FLOAT\n");   variableInitializeCheckflag=true; keyword++;}
"KOK"        					{ printf("DATA_TYPE_STRING\n");  variableInitializeCheckflag=true; keyword++;}
"KOKTHAI"                       { printf("DATA_TYPE_CHAR\n");   variableInitializeCheckflag=true; keyword++;}
"ONGMANO"                       { printf("DATA_TYPE_BOOL\n");   variableInitializeCheckflag=true; keyword++;}
"MUNGSAYA"                      { printf("DATA_TYPE_VOID\n");   variableInitializeCheckflag=true; keyword++;}

"IMO"           				{ printf("IF\n"); keyword++;}
"IMOYA"         				{ printf("ELSE IF\n");  keyword++;}
"IMOYAKHAI"         			{ printf("ELSE\n");  keyword++;}
"LAMA"               			{ printf("SWITCH\n");  keyword++;}
"CASE"               			{ printf("CASE\n");  keyword++;}
"ONGTHAI"               		{ printf("DEFAULT\n");  keyword++;}
"BAGWI"          				{ printf("FOR\n");  keyword++;}
"BAIFU"          				{ printf("WHILE\n");  keyword++;}
"KHAI"         		        	{ printf("DO\n");  keyword++;}
"SABAI"          				{ printf("BREAK\n");  keyword++;}
"KHAITONG"          			{ printf("CONTINUE\n");  keyword++;}
"FIROK"        					{ printf("RETURN\n");  keyword++;}
"UROTHANG"        				{ printf("GOTO\n");  keyword++;}
"LA"        					{ printf("SCANF\n");  keyword++;}
"FUNU"        					{ printf("PRINT\n");  keyword++;}

"AUTO"           				{ printf("AUTO\n");  keyword++;}
"STATIC"           				{ printf("STATIC\n");  keyword++;}
"REGISTER"           			{ printf("REGISTER\n");  keyword++;}
"EXTERN"           				{ printf("EXTERN\n");  keyword++;}

"CLASS"            				{ printf("CLASS\n");  keyword++;}
"STRUCT"           				{ printf("STRUCT\n");  keyword++;}
"ENUM"            				{ printf("ENUM\n");  keyword++;}
"NAMESPACE"           			{ printf("NAMESPACE\n");  keyword++;}
"TEMPLATE"            			{ printf("TEMPLATE\n");  keyword++;}
"NEW"           				{ printf("NEW\n");  keyword++;}
"DELETE"           				{ printf("DELETE\n");  keyword++;}
"THIS"             				{ printf("THIS\n");  keyword++;}
"CONST"            				{ printf("CONST\n");  keyword++;}
"SIZEOF"           				{ printf("SIZEOF\n");  keyword++;}
"OPERATOR"             			{ printf("OPERATOR\n");  keyword++;}
"FRIEND"             			{ printf("FRIEND\n");  keyword++;}
"VIRTUA"             			{ printf("VIRTUAL\n");  keyword++;}
"EXPLICIT"             			{ printf("EXPLICIT\n");  keyword++;}
"TRY"           				{ printf("TRY\n");  keyword++;}
"CATCH"            				{ printf("CATCH\n");  keyword++;}
"THROW"            				{ printf("THROW\n");  keyword++;}
"TYPEID"            			{ printf("TYPEID\n");  keyword++;}
"MUTABLE"       				{ printf("MUTABLE\n");  keyword++;}

[+]             				{ printf("PLUS\n"); }
[-]             				{ printf("MINUS\n"); }
[*]             				{ printf("MULTIPLICATION\n"); }
[/]             				{ printf("DIVISION\n"); }
[%]             				{ printf("MOD\n"); }


[=][=]            				{ printf("EQUALS\n"); }
[!][=]            				{ printf("NOT EQUALS\n"); }
[<]             				{ printf("LESS_THAN\n"); }
[>]             				{ printf("GREATER_THAN\n"); }
[<][=]          				{ printf("LESS_THAN_OR_EQUAL\n"); }
[>][=]          				{ printf("GREATER_THAN_OR_EQUAL\n"); }


[&][&]             				{ printf("LOGICAL AND\n"); }
[|][|]             				{ printf("LOGICAL OR\n"); }
[!]             				{ printf("LOGICAL NOT\n"); }


[=]             				{ printf("ASSIGNMENT\n"); }
[+][=]             				{ printf("ADDITION ASSIGNMENT\n"); }
[-][=]          				{ printf("SUBTRACTION ASSIGNMENT\n"); }
[*][=]             				{ printf("MULTIPLICATION ASSIGNMENT\n"); }
[/][=]             				{ printf("DIVISION ASSIGNMENT\n"); }
[%][=]             				{ printf("MODULUS ASSIGNMENT\n"); }


[+][+]             				{ printf("INCREMENT\n"); }
[-][-]             				{ printf("DECREMENT\n"); }


[&]             				{ printf("BITWISE AND\n"); }
[|]             				{ printf("BITWISE OR\n"); }
"^"             				{ printf("BITWISE XOR\n"); }
[~]             				{ printf("BITWISE NOT\n"); }
[<][<]             				{ printf("LEFTSHIFT\n"); }
[>][>]             				{ printf("RIGHTSHIFT\n"); }


\"[^\"]*\"						{ printf("LITERAL\n"); }
{ID}   							{ printf("IDENTIFIER\n"); mp[yytext]?(printf("%s variable is declared before.\n",yytext)):(variableInitializeCheckflag?variable++,mp[yytext]++:variable);}
[+-]?{DIGIT}+            		{ printf("INTEGER\n"); }
[+-]?{DIGIT}+[.]{DIGIT}+		{ printf("FLOAT\n"); }
[ \t\n]+        
"//"(.)*"\n"     				{ printf("SINGLE_LINE_COMMENT\n"); }
[/][*](.*|\n)*[*][/] 			{ printf("MULTI_LINE_COMMENT\n"); }
[.]             				{ printf("END_OF_STATEMENT\n"); variableInitializeCheckflag=false;statement++;}
[,]             				{ printf("MORE_STATEMENT\n"); }
"("             				{ printf("PARENTHESIS_START\n"); }
")"								{ printf("PARENTHESIS_END\n"); }
"{"            					{ printf("BRACES_START\n"); }
"}"            					{ printf("BRACES_END\n"); }

.               				{ printf("INVALID_CHARACTER: %s\n", yytext); variableInitializeCheckflag=false;}

%%

int yywrap(){
	return 1;
}

int main(){
	yyin=fopen("input1.txt","r");
	yylex();
    cout<<"WELCOME TO MAIN FUNCTION"<<endl;
    cout<<"Variable: "<<variable<<endl;
    cout<<"Keyword: "<<keyword<<endl;
    cout<<"Statement: "<<statement<<endl;
    cout<<endl;
	return 0;
}