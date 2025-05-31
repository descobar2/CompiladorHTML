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

//RESERVADAS--------------------------------------------------------------------
//---SIMBOLOS
    Asignar = "="
    Coma = ","
    Numeral = "#"
    Dolar = "$"
    CierreDiag = "/"
    AperturaE = "<"
    CierreE = ">"
    Admiracion = "!"
    
//---RESERVADAS (orden importante: más específicas primero)
    Doctype = "DOCTYPE"
    Html = "html"
    Head = "head"
    Title = "title"
    Body = "body"
    Div = "div"
    Align = "align"
    Lang = "lang"
    Parrafo = "p"
    Imagen = "img"
    Source = "src"
    Alt = "alt"
    Width = "width"
    Left = "left"
    Right = "right"
    Center = "center"
    Justify = "justify"
    Middle = "middle"

//---REGEX
    Enter = \r|\n|\r\n|\u2028|\u2029|\000B|\000c|\0085
    Espacios = [\ \t\f\b\r\n]
    Ident = [A-Za-zñÑÁáÉéÍíÓóÚú][._0-9A-Za-zñÑÁáÉéÍíÓóÚú]*
    Texto = [A-Za-zñÑÁáÉéÍíÓóÚú0-9\s\.\_\-]+

%%
//TOKENS------------------------------------------------------------------------

//---SÍMBOLOS
    <YYINITIAL> {Asignar} {
        GUI.listaTokens.add(new Token(yytext(), "Asignar", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Asignar, (yyline + 1), (yycolumn + 1), yytext());
    }    
    <YYINITIAL> {Coma} {
        GUI.listaTokens.add(new Token(yytext(), "Coma", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Coma, (yyline + 1), (yycolumn + 1), yytext());
    }    
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

//---RESERVADAS (orden importante: palabras más específicas primero)
    <YYINITIAL> {Doctype} {
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Doctype, (yyline + 1), (yycolumn + 1), yytext());
    }
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
        return new Symbol(sym.Img, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Source} {
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Src, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Alt} {
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Alt, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Width} {
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Width, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Left} {
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Left, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Right} {
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Right, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Center} {
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Center, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Justify} {
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Justify, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Middle} {
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Middle, (yyline + 1), (yycolumn + 1), yytext());
    }

//---REGEX
    <YYINITIAL> "\"" {
        yybegin(CADENA);
        cadena = "";
        tamano = 0;
        inicio = yychar;
    }
    <YYINITIAL> {Espacios} {
        /*SE OMITEN LOS ESPACIOS*/
    }
    <YYINITIAL> {Enter} {
        /*FUNCIONA COMO DELIMITADOR EN VEZ DEL PUNTO Y COMA*/
    }
    <YYINITIAL> {Ident} {
        GUI.listaTokens.add(new Token(yytext(), "Identificador", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Ident, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Texto} {
        GUI.listaTokens.add(new Token(yytext(), "Texto", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Texto, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> . {
        GUI.errores.add(new NodoError(yytext(), (yyline + 1), (yycolumn + 1), "Léxico", "Caracter no valido."));
    }

//---ESTADOS
    <CADENA> {
        (\\r) {
            cadena += "\r";
            tamano += 2;
        }
        (\\n) {
            cadena += "\n";
            tamano += 2;
        }
        (\\t) {
            cadena += "\t";
            tamano += 2;
        }
        (\\\") {
            cadena += "\"";
            tamano += 2;
        }
        (\\\\) {
            cadena += "\\";
            tamano += 2;
        }
        [\"] {
            String tmp = cadena;
            cadena = "";
            yybegin(YYINITIAL);
            GUI.listaTokens.add(new Token(tmp, "Cadena", (yyline + 1), (yycolumn + 1)));
            return new Symbol(sym.CADENA, (yyline + 1), (yycolumn + 1), tmp);
        }
        . {
            cadena += yytext();
            tamano += yylength();
        }
    }