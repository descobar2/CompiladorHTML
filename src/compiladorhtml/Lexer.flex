package compiladorhtml;

import java_cup.runtime.Symbol;
import Nodos.NodoError;
import Nodos.Token;

%%

%{
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

//RESERVADAS--------------------------------------------------------------------
//---SIMBOLOS
    Numeral = "#"
    Dolar = "$"
    CierreDiag = "/"
    AperturaE = "<"
    CierreE = ">"
    Admiracion = "!"
    Igual = "="
    
//---RESERVADAS
    Html = "html"
    Head = "head"
    Title = "title"
    Body = "body"
    Div = "div"
    Align = "align"
    Doctype = "DOCTYPE"
    Lang = "lang"
    Parrafo = "p"
    Imagen = "img"
    Source = "src"
    Alt = "alt"
    Width = "width"

//---REGEX
    Enter = \r|\n|\r\n|\u2028|\u2029|\000B|\000c|\0085
    // Entero = [0-9]+
    Espacios = [\ \t\f\b\r\n]
    // Flotante = [0-9]+[.][0-9]+
    Ident = ([A-Za-zñÑÁáÉéÍíÓóÚú]|("."[._A-Za-zñÑÁáÉéÍíÓóÚú]))[._0-9A-Za-zñÑÁáÉéÍíÓóÚú]*

%%
//TOKENS------------------------------------------------------------------------

//---SímboloS
    <YYINITIAL> {Numeral} {
        GUI.listaTokens.add(new Token(yytext(), "Numeral", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Numeral, (yyline + 1), (yycolumn + 1), yytext());
    }    
    <YYINITIAL> {Dolar} {
        GUI.listaTokens.add(new Token(yytext(), "Dólar", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Dolar, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {CierreDiag} {
        GUI.listaTokens.add(new Token(yytext(), "Cierre diagonal", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.CierreDiag, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {AperturaE} {
        GUI.listaTokens.add(new Token(yytext(), "Apertura de etiqueta", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.AperturaE, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {CierreE} {
        GUI.listaTokens.add(new Token(yytext(), "Cierre de etiqueta", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.CierreE, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Admiracion} {
        GUI.listaTokens.add(new Token(yytext(), "Admiración", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Admiracion, (yyline + 1), (yycolumn + 1), yytext());
    }

//---RESERVADAS
    <YYINITIAL> {Html} {
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Html, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Head} {
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Head, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Title} {
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Title, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Body} {
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Body, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Div} {
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Div, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Align} {
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Align, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Doctype} {
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Doctype, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Lang} {
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Lang, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Parrafo} {
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Parrafo, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Imagen} {
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Imagen, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Source} {
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Source, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Alt} {
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Alt, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Width} {
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Width, (yyline + 1), (yycolumn + 1), yytext());
    }

//---REGEX
    <YYINITIAL> "\"" {
        yybegin(CADENA);
        //cadena += "\"";
        tamano = 0;
        inicio = yychar;
    }
    <YYINITIAL> "#" {
        yybegin(COMLINEA);
        comL += "#";
        tamano = 0;
        inicio = yychar;
    }
    <YYINITIAL> "#*" {
        yybegin(COMMULTI);
        comM += "#*";
        tamano = 0;
        inicio = yychar;
    }
    <YYINITIAL> {Espacios} {
        /*SE OMITEN LOS ESPACIOS*/
    }
    <YYINITIAL> {Enter} {
        /*FUNCIONA COMO DELIMITADOR EN VEZ DEL PUNTO Y COMA*/
        //GUI.listaTokens.add(new Token(yytext(), "Numero", (yyline + 1), (yycolumn + 1)));
        //return new Symbol(sym.Enter, (yyline + 1), (yycolumn + 1), yytext());
    }
    // <YYINITIAL> {Entero} {
    //     GUI.listaTokens.add(new Token(yytext(), "Integer", (yyline + 1), (yycolumn + 1)));
    //     return new Symbol(sym.Entero, (yyline + 1), (yycolumn + 1), yytext());
    // }
    // <YYINITIAL> {Flotante} {
    //     GUI.listaTokens.add(new Token(yytext(), "Numeric", (yyline + 1), (yycolumn + 1)));
    //     return new Symbol(sym.Flotante, (yyline + 1), (yycolumn + 1), yytext());
    // }
    <YYINITIAL> {Ident} {
        GUI.listaTokens.add(new Token(yytext(), "Identificador", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Ident, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> . {
        GUI.errores.add(new NodoError(yytext(), (yyline + 1), (yycolumn + 1), "Léxico", "Caracter no valido."));
    }

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
            GUI.listaTokens.add(new Token(tmp, "Cadena", (yyline + 1), (yycolumn + 1)));
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
            GUI.listaTokens.add(new Token(tmp, "Comentario de linea", (yyline + 1), (yycolumn + 1)));
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
            GUI.listaTokens.add(new Token(tmp, "Comentario multilinea", (yyline + 1), (yycolumn + 1)));
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