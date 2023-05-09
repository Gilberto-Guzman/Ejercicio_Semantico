
package codigo;
import java_cup.runtime.Symbol;

%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup     
%full         
%line
%char

%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
    
%}

I=[a-zA-Z_]+
D=[0-9]+ 
WHITE = [ ,\t,\r\n]+

%%

int                 {return new Symbol(sym.TD_INT, yychar, yyline, yytext());}
string              {return new Symbol(sym.TD_STRING, yychar, yyline, yytext());} 
char                {return new Symbol(sym.TD_CHAR, yychar, yyline, yytext());}

do                  {return new Symbol(sym.PR_DO, yychar, yyline, yytext());}
if                  {return new Symbol(sym.PR_IF, yychar, yyline, yytext());}
while               {return new Symbol(sym.PR_WHILE, yychar, yyline, yytext());}
return              {return new Symbol(sym.PR_RETURN, yychar, yyline, yytext());}


";"                 {return new Symbol(sym.PUNTOYC, yychar, yyline, yytext());}
"," | " ," 
| ", "              {return new Symbol(sym.COMA, yychar, yyline, yytext());}
"("                 {return new Symbol(sym.P_OPEN, yychar, yyline, yytext());}
")"                 {return new Symbol(sym.P_CLOSE, yychar, yyline, yytext());}
"{"                 {return new Symbol(sym.LLAVES_APER, yychar, yyline, yytext()); }
"}"                 {return new Symbol(sym.LLAVES_CIERR, yychar, yyline, yytext()); }

"="                 {return new Symbol(sym.IGUAL, yychar, yyline, yytext());}
">"                 {return new Symbol(sym.MAYORQ, yychar, yyline, yytext());}
"<"                 {return new Symbol(sym.MENORQ, yychar, yyline, yytext());}

"+"                 {return new Symbol(sym.O_SUMA, yychar, yyline, yytext());}
"-"                 {return new Symbol(sym.O_RESTA, yychar, yyline, yytext());}


{WHITE}             {/* */}

"\""(.[^\"]*"\"")   {return new Symbol(sym.CADENA_CARACT, yychar, yyline, yytext());}
("(-"{D}+")")|{D}+  {return new Symbol(sym.INT, yychar, yyline, yytext());}
{D}("."{D})         {return new Symbol(sym.FLOAT, yychar, yyline, yytext());}
{I}({I}|{D})*       {return new Symbol(sym.IDENTIFICADOR, yychar, yyline, yytext());}