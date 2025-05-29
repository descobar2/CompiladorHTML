package compiladorhtml;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Tipos de datos */
( byte | char | long | float | double ) {return new Symbol(sym.T_dato, yychar, yyline, yytext());}

/* Tipo de dato Int (Para el main) */
( "int" ) {return new Symbol(sym.Int, yychar, yyline, yytext());}

/* Tipo de dato String */
( String ) {return new Symbol(sym.Cadena, yychar, yyline, yytext());}

/* Palabra reservada If */
( if ) {return new Symbol(sym.If, yychar, yyline, yytext());}

/* Palabra reservada Else */
( else ) {return new Symbol(sym.Else, yychar, yyline, yytext());}

/* Palabra reservada Do */
( do ) {return new Symbol(sym.Do, yychar, yyline, yytext());}

/* Palabra reservada While */
( while ) {return new Symbol(sym.While, yychar, yyline, yytext());}

/* Palabra reservada For */
( for ) {return new Symbol(sym.For, yychar, yyline, yytext());}

/* Operador Suma */
( "+" ) {return new Symbol(sym.Suma, yychar, yyline, yytext());}

/* Operador Resta */
( "-" ) {return new Symbol(sym.Resta, yychar, yyline, yytext());}

/* Operador Multiplicacion */
( "*" ) {return new Symbol(sym.Multiplicacion, yychar, yyline, yytext());}

/* Operador Division */
( "/" ) {return new Symbol(sym.Division, yychar, yyline, yytext());}

/* Operadores logicos */
( "&&" | "||" | "!" | "&" | "|" ) {return new Symbol(sym.Op_logico, yychar, yyline, yytext());}

/*Operadores Relacionales */
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {return new Symbol(sym.Op_relacional, yychar, yyline, yytext());}

/* Operadores Atribucion */
( "+=" | "-="  | "*=" | "/=" | "%=" | "=" ) {return new Symbol(sym.Op_atribucion, yychar, yyline, yytext());}

/* Operadores Incremento y decremento */
( "++" | "--" ) {return new Symbol(sym.Op_incremento, yychar, yyline, yytext());}

/*Operadores Booleanos*/
( true | false ) {return new Symbol(sym.Op_booleano, yychar, yyline, yytext());}

/* Parentesis de apertura */
( "(" ) {return new Symbol(sym.Parentesis_a, yychar, yyline, yytext());}

/* Parentesis de cierre */
( ")" ) {return new Symbol(sym.Parentesis_c, yychar, yyline, yytext());}

/* Llave de apertura */
( "{" ) {return new Symbol(sym.Llave_a, yychar, yyline, yytext());}

/* Llave de cierre */
( "}" ) {return new Symbol(sym.Llave_c, yychar, yyline, yytext());}

/* Corchete de apertura */
( "[" ) {return new Symbol(sym.Corchete_a, yychar, yyline, yytext());}

/* Corchete de cierre */
( "]" ) {return new Symbol(sym.Corchete_c, yychar, yyline, yytext());}

/* Marcador de inicio de algoritmo */
( "main" ) {return new Symbol(sym.Main, yychar, yyline, yytext());}

/* Punto y coma */
( ";" ) {return new Symbol(sym.P_coma, yychar, yyline, yytext());}

/* Identificador */
{L}({L}|{D})* {return new Symbol(sym.Identificador, yychar, yyline, yytext());}

/* Numero */
("(-"{D}+")")|{D}+ {return new Symbol(sym.Numero, yychar, yyline, yytext());}

/* Error de analisis */
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}

 /* simbolos */
( "#" )     {return new Symbol(sym.Numeral, yychar, yyline, yytext());}
( "$" )     {return new Symbol(sym.Dolar, yychar, yyline, yytext());}
( "/" )     {return new Symbol(sym.CierreDiag, yychar, yyline, yytext());}
( "<" )     {return new Symbol(sym.AperturaE, yychar, yyline, yytext());}
( ">" )     {return new Symbol(sym.CierreE, yychar, yyline, yytext());}
( "!" )     {return new Symbol(sym.Admiracion, yychar, yyline, yytext());}
( "=" )     {return new Symbol(sym.Igual, yychar, yyline, yytext());}
( "\"" )    {return new Symbol(sym.Comillas, yychar, yyline, yytext());}

/* Palabras reservadas*/
( "p" )     {return new Symbol(sym.Parrafo, yychar, yyline, yytext());}
( "en" )    {return new Symbol(sym.En, yychar, yyline, yytext());}
( "es" )    {return new Symbol(sym.Es, yychar, yyline, yytext());}
( "img" )   {return new Symbol(sym.Img, yychar, yyline, yytext());}
( "src" )   {return new Symbol(sym.Src, yychar, yyline, yytext());}
( "alt" )   {return new Symbol(sym.Alt, yychar, yyline, yytext());}
( "html" )  {return new Symbol(sym.Html, yychar, yyline, yytext());}
( "head" )  {return new Symbol(sym.Head, yychar, yyline, yytext());}
( "title" ) {return new Symbol(sym.Title, yychar, yyline, yytext());}
( "body" )  {return new Symbol(sym.Body, yychar, yyline, yytext());}
( "div" )   {return new Symbol(sym.Div, yychar, yyline, yytext());}
( "align" ) {return new Symbol(sym.Align, yychar, yyline, yytext());}
( "width" ) {return new Symbol(sym.Width, yychar, yyline, yytext());}
( "lang" )  {return new Symbol(sym. Lang, yychar, yyline, yytext());}
( "left" )  {return new Symbol(sym.Left, yychar, yyline, yytext());}
( "right" )     {return new Symbol(sym.Right, yychar, yyline, yytext());}
( "center" )    {return new Symbol(sym.Center, yychar, yyline, yytext());}
( "justify" )   {return new Symbol(sym.Justify, yychar, yyline, yytext());}
( "DOCTYPE" )   {return new Symbol(sym.Doctype, yychar, yyline, yytext());}