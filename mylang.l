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

{ID}        { printf("IDENTIFIER\n"); }
{INTEGER}   { printf("INTEGER\n"); }
{FLOAT}     { printf("FLOAT\n"); }
{STRING}    { printf("STRING\n"); }
{CHAR}      { printf("CHARACTER\n"); }

"~"[^~\n]*          { printf("SINGLE_LINE_COMMENT\n"); } // Tek satır yorum desteği eklendi
"~"([^*]|"~")*"~"   { printf("BLOCK_COMMENT\n"); }      // Mevcut blok yorumun geliştirildi

[ \t\r]+    { /* Boşlukları yoksay */ }
\n          { line_num++; } // Satır sayısını artır
.           { printf("UNKNOWN: %s at line %d\n", yytext, line_num); } // Hata mesajına satır eklendi

%%

int yywrap() { return 1; }

int main() {
    yylex();
    return 0;
}
