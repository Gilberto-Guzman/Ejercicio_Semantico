

package codigo;
import static codigo.Token.*;

%%
%class Lexer 
%type Token

%{
    public String lexeme;
%}

I=[a-zA-Z_]+
D=[0-9]+ 
WHITE = [ ,\t,\r]+


%%
/*__________________________________*/
/*      int main() {                */
/*          int num1 = 10;          */

/*          do {                    */
/*              if ( num1 > 5 ) {   */
/*                  num1 = 2;       */
/*              }                   */
/*          } while ( num1 < 5 );   */

/*          return 0;               */
/*      }                           */
/*___________________________________*/
\n                  {return SALTO_DL;}


int                 {lexeme=yytext(); return TD_INT;}
string              {lexeme=yytext(); return TD_STRING;}
char                {lexeme=yytext(); return TD_CHAR;}

do                  {lexeme=yytext(); return PR_DO;}
if                  {lexeme=yytext(); return PR_IF;}
while               {lexeme=yytext(); return PR_WHILE;}
return              {lexeme=yytext(); return PR_RETURN;}

";"                 {lexeme=yytext(); return PUNTOYC;}
"," | " ," 
| ", "              {lexeme=yytext(); return COMA;}
"("                 {lexeme=yytext(); return P_OPEN;}
")"                 {lexeme=yytext(); return P_CLOSE;}
"{"                 {lexeme=yytext(); return LLAVES_APER; } 
"}"                 {lexeme=yytext(); return LLAVES_CIERR; }

"="                 {lexeme=yytext(); return IGUAL;}
">"                 {lexeme=yytext(); return MAYORQ;}
"<"                 {lexeme=yytext(); return MENORQ;}

"+"                 {lexeme=yytext(); return O_SUMA;} 
"-"                 {lexeme=yytext(); return O_RESTA;}

{WHITE}             {/* */}                                         /* WHITE = [ ,\t,\r]+ */

"\""(.[^\"]*"\"")    {lexeme=yytext(); return CADENA_CARACT; }
("(-"{D}+")")|{D}+  {lexeme=yytext(); return INT; }                 /* D=[0-9]+ */
{D}("."{D})         {lexeme=yytext(); return FLOAT; }               
{I}({I}|{D})*       {lexeme=yytext(); return IDENTIFICADOR; }       /* I=[a-zA-Z_]+ */

 . {return ERROR;} 



