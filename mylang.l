%{
#include <stdio.h>
//#include "y.tab.h" 
int line_num = 1; // Satır takibi için ekledik
%}

DIGIT       [0-9]
LETTER      [a-zA-Z]
ID          {LETTER}({LETTER}|{DIGIT}|_)*
INTEGER     {DIGIT}+
FLOAT       {DIGIT}+"."{DIGIT}+
STRING      \"([^\"]*)\"
CHAR        \'[^']\'

%%
"if"         { printf("IF\n"); }
"else"       { printf("ELSE\n"); }
"for"        { printf("FOR\n"); }
"do"         { printf("DO\n"); }
"while"      { printf("WHILE\n"); }
"func"       { printf("FUNC\n"); }
"return"     { printf("RETURN\n"); }
"print"      { printf("PRINT\n"); }
"exit"       { printf("EXIT\n"); }
"input"      { printf("INPUT\n"); }
"true"       { printf("TRUE\n"); }
"false"      { printf("FALSE\n"); }
"const"      { printf("CONST\n"); }
"+"          { printf("PLUS\n"); }
"-"          { printf("MINUS\n"); }
"/"          { printf("DIVIDE\n"); }
"%"          { printf("MODULO\n"); }
"**"         { printf("POW\n"); }
"*"          { printf("*\n"); }
"="          { printf("=\n"); }
"<"          { printf("<\n"); }
">"          { printf(">\n"); }
"=="         { printf("EQ\n"); }
"<="         { printf("LEQ\n"); }
">="         { printf("GEQ\n"); }
"!="         { printf("NEQ\n"); }
"&&"         { printf("AND\n"); }
"||"         { printf("OR\n"); }
"!"          { printf("NOT\n"); }
"("          { printf("LPAREN\n"); }
")"          { printf("RPAREN\n"); }
"{"          { printf("LBRACE\n"); }
"}"          { printf("RBRACE\n"); }
":"          { printf("COLON\n"); }
";"          { printf("SEMICOLON\n"); }
","          { printf("COMMA\n"); }


"~"[^~\n]*"~"          { /* comment */ }

[ \t\r\n]+    { /* Boşlukları yoksay; \n ise satır sayısını artır */
                for(char *p = yytext; *p; ++p) if(*p == '\n') ++line_num;
            }

{FLOAT}     { printf("FLOAT %s\n", yytext); }
{INTEGER}   { printf("INTEGER %s\n", yytext); }
{ID}        { printf("IDENTIFIER %s\n", yytext); }
{STRING}    { printf("STRING %s\n", yytext); }
{CHAR}      { printf("CHARACTER %s\n", yytext); }

.           { printf("UNKNOWN: %s at line %d\n", yytext, line_num); } // Hata mesajına satır eklendi

%%

int yywrap() { return 1; }

int main() {
    yylex();
    return 0;
}
