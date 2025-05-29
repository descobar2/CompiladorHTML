package compiladorhtml;
import static compiladorhtml.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
%{
    public String lexeme;
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Salto de linea */
( "\n" ) {return Linea;}

/* Tipos de datos */
( byte | int | char | long | float | double ) {lexeme=yytext(); return T_dato;}

/* Tipo de dato String */
( String ) {lexeme=yytext(); return Cadena;}

/* Palabra reservada If */
( if ) {lexeme=yytext(); return If;}

/* Palabra reservada Else */
( else ) {lexeme=yytext(); return Else;}

/* Palabra reservada Do */
( do ) {lexeme=yytext(); return Do;}

/* Palabra reservada While */
( while ) {lexeme=yytext(); return While;}

/* Palabra reservada For */
( for ) {lexeme=yytext(); return For;}

/* Operador Suma */
( "+" ) {lexeme=yytext(); return Suma;}

/* Operador Resta */
( "-" ) {lexeme=yytext(); return Resta;}

/* Operador Multiplicacion */
( "*" ) {lexeme=yytext(); return Multiplicacion;}

/* Operador Division */
( "/" ) {lexeme=yytext(); return Division;}

/* Operadores logicos */
( "&&" | "||" | "!" | "&" | "|" ) {lexeme=yytext(); return Op_logico;}

/*Operadores Relacionales */
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {lexeme = yytext(); return Op_relacional;}

/* Operadores Atribucion */
( "+=" | "-="  | "*=" | "/=" | "%=" ) {lexeme = yytext(); return Op_atribucion;}

/* Operadores Incremento y decremento */
( "++" | "--" ) {lexeme = yytext(); return Op_incremento;}

/*Operadores Booleanos*/
(true | false)      {lexeme = yytext(); return Op_booleano;}

/* Parentesis de apertura */
( "(" ) {lexeme=yytext(); return Parentesis_a;}

/* Parentesis de cierre */
( ")" ) {lexeme=yytext(); return Parentesis_c;}

/* Llave de apertura */
( "{" ) {lexeme=yytext(); return Llave_a;}

/* Llave de cierre */
( "}" ) {lexeme=yytext(); return Llave_c;}

/* Corchete de apertura */
( "[" ) {lexeme = yytext(); return Corchete_a;}

/* Corchete de cierre */
( "]" ) {lexeme = yytext(); return Corchete_c;}

/* Marcador de inicio de algoritmo */
( "main" ) {lexeme=yytext(); return Main;}

/* Punto y coma */
( ";" ) {lexeme=yytext(); return P_coma;}

/* Identificador */
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}

/* Numero */
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}

/* Error de analisis */
 . {return ERROR;}

/* simbolos */
( "#" )     {lexeme=yytext(); return Numeral;}
( "$" )     {lexeme=yytext(); return Dolar;}
( "/" )     {lexeme=yytext(); return CierreDiag;}
( "<" )     {lexeme=yytext(); return AperturaE;}
( ">" )     {lexeme=yytext(); return CierreE;}
( "!" )     {lexeme=yytext(); return Admiracion;}
( "=" )     {lexeme=yytext(); return Igual;}
( "\"" )    {lexeme=yytext(); return Comillas;}

/* Palabras reservadas*/
( "p" )     {lexeme=yytext(); return Parrafo;}
( "en" )    {lexeme=yytext(); return En;}
( "es" )    {lexeme=yytext(); return Es;}
( "img" )  {lexeme=yytext(); return Img;}
( "src" )  {lexeme=yytext(); return Src;}
( "alt" )  {lexeme=yytext(); return Alt;}
( "html" )  {lexeme=yytext(); return Html;}
( "head" )  {lexeme=yytext(); return Head;}
( "title" ) {lexeme=yytext(); return Title;}
( "body" )  {lexeme=yytext(); return Body;}
( "div" )   {lexeme=yytext(); return Div;}
( "align" ) {lexeme=yytext(); return Align;}
( "width" ) {lexeme=yytext(); return Width;}
( "lang" )  {lexeme=yytext(); return Lang;}
( "left" )  {lexeme=yytext(); return Left;}
( "right" ) {lexeme=yytext(); return Right;}
( "center" ) {lexeme=yytext(); return Center;}
( "justify" )   {lexeme=yytext(); return Justify;}
( "DOCTYPE" )   {lexeme=yytext(); return Doctype;}


