package compiladorhtml;
import static compiladorhtml.Tokens.*;
import java_cup.runtime.Symbol;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
%{
    public String lexeme;
    String cadena = "";
    String comL = "";
    String comM = "";
    int inicio = 0;
    int tamano = 0;
%}

%cup
%class scanner
%public
%line
%char
%column
%full
%state CADENA
%state COMLINEA
%state COMMULTI
%ignorecase

%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios 
( "//"(.)* ) {/*Ignore*/} */

/* Salto de linea */
( "\n" ) {/*Ignore*/}

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

/* Numero */
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}

/* simbolos */
( "#" )     {lexeme=yytext(); return Numeral;}
( "$" )     {lexeme=yytext(); return Dolar;}
( "/" )     {lexeme=yytext(); return CierreDiag;}
( "<" )     {lexeme=yytext(); return AperturaE;}
( ">" )     {lexeme=yytext(); return CierreE;}
( "!" )     {lexeme=yytext(); return Admiracion;}
( "=" )     {lexeme=yytext(); return Igual;}
/*
( "\"" )    {lexeme=yytext(); return Comillas;} */

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

/* Identificador */
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}

[\"] {
            String tmp = cadena; //+ "\"";
            cadena = "";
            yybegin(YYINITIAL);
            return new Symbol(sym.CADENA, (yyline + 1), (yycolumn + 1), tmp);
}

/* Error de analisis */
 . {return ERROR;}

//---ESTADOS
    <CADENA> {//EL CODIGO ESCRITO ES PARA GUARDAR LA CADENA; SE DEBE DECLARAR LOS ESTADOS Y VARIABLES EN JFLEX Y CUP
        (\\r) {
            cadena += "\r";
            tamano += 2;
            //System.out.println("-> Retorno de carrete");
        }
        (\\n) {
            cadena += "\n";
            tamano += 2;
            //System.out.println("-> Salto de linea");
        }
        (\\t) {
            cadena += "\t";
            tamano += 2;
            //System.out.println("-> Tabulador");
        }
        (\\\") {
            cadena += "\"";
            tamano += 2;
            //System.out.println("-> Comilla");
        }
        (\\\\) {
            cadena += "\\";
            tamano += 2;
            //System.out.println("-> Diagonal invertida");
        }
        [\"] {
            String tmp = cadena; //+ "\"";
            cadena = "";
            yybegin(YYINITIAL);
            return new Symbol(sym.CADENA, (yyline + 1), (yycolumn + 1), tmp);
        }
        . {
            cadena += yytext();
            tamano += yylength();
            //System.out.println("-> Agregar");
        }
    }

    <COMLINEA> {//EL CODIGO ESCRITO ES PARA GUARDAR EL COMENTARIO; SE DEBE DECLARAR LOS ESTADOS Y VARIABLES EN JFLEX Y CUP
        [\r\n] {//PUEDE SOLO REGRESAR AL ESTADO YYINITIAL.
            String tmp = comL;
            comL = "";
            yybegin(YYINITIAL);
        }
        [^\r\n]* {//PUEDE NO HACERSE NADA
            comL += yytext();
            tamano += yylength();
        }
    }

    <COMMULTI> {//EL CODIGO ESCRITO ES PARA GUARDAR EL COMENTARIO; SE DEBE DECLARAR LOS ESTADOS Y VARIABLES EN JFLEX Y CUP
        "*#" {
            String tmp = comM + "*#";
            comM = "";
            yybegin(YYINITIAL);
        }
        "#" {
            comM += yytext();
            tamano += yylength();
        }
        "*" {
            comM += yytext();
            tamano += yylength();
        }
        [^"*#"]* {
            comM += yytext();
            tamano += yylength();
        }
        <<EOF>> {
            GUI.errores.add(new NodoError(yytext(), (yyline + 1), (yycolumn + 1), "Léxico", "Se esperaba cierre de comentario."));
        }
    }