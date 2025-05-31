package compiladorhtml;

import java_cup.runtime.Symbol;
import Nodos.NodoError;
import Nodos.Token;
import static compiladorhtml.GUI.tablaSimbolo;
import javax.swing.table.DefaultTableModel;

%%

%{
    String cadena = "";
    String comL = "";
    String comM = "";
    int inicio = 0;
    int tamano = 0;
    
    private DefaultTableModel modeloSimbolos = (DefaultTableModel) tablaSimbolo.getModel();
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
    PuntoComa = ";"
    
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
    Right = "\\"right\\""
    Center = "center"
    Justify = "justify"
    Middle = "middle"
    Entero = "IntEntero"

//---REGEX
    Enter = \r|\n|\r\n|\u2028|\u2029|\000B|\000c|\0085
    Espacios = [\ \t\f\b\r\n]
    Ident = [A-Za-zñÑÁáÉéÍíÓóÚú][._0-9A-Za-zñÑÁáÉéÍíÓóÚú]*
    Numero=[0-9]+

%%
//TOKENS------------------------------------------------------------------------

//---SÍMBOLOS
    <YYINITIAL> {Asignar} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Asignar", (yyline + 1), (yycolumn + 1)});
        modeloSimbolos.addRow(new Object[]{yytext(), "Asignar", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Asignar", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Asignar, (yyline + 1), (yycolumn + 1), yytext());
    }    
    <YYINITIAL> {Coma} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Coma", (yyline + 1), (yycolumn + 1)});
        modeloSimbolos.addRow(new Object[]{yytext(), "Coma", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Coma", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Coma, (yyline + 1), (yycolumn + 1), yytext());
    }    
    <YYINITIAL> {Numeral} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Numeral", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Numeral", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Numeral, (yyline + 1), (yycolumn + 1), yytext());
    }    
    <YYINITIAL> {Dolar} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Dólar", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Dólar", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Dolar, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {CierreDiag} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Cierre diagonal", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Cierre diagonal", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.CierreDiag, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {AperturaE} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Apertura de etiqueta", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Apertura de etiqueta", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.AperturaE, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {CierreE} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Cierre de etiqueta", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Cierre de etiqueta", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.CierreE, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Admiracion} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Admiración", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Admiración", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Admiracion, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Coma} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Coma", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Coma", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Coma, (yyline + 1), (yycolumn + 1), yytext());
    }

//---RESERVADAS (orden importante: palabras más específicas primero)
    <YYINITIAL> {Doctype} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Doctype, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Html} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Html, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Head} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Head, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Title} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Title, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Body} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Body, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Div} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Div, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Align} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Align, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Lang} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Lang, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Parrafo} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Parrafo, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Imagen} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Img, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Source} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Src, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Alt} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Alt, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Width} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Width, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Left} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Left, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Right} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Right, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Center} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Center, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Justify} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Justify, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Middle} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Middle, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Entero} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Entero, (yyline + 1), (yycolumn + 1), yytext());
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
        modeloSimbolos.addRow(new Object[]{yytext(), "Identificador", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Identificador", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Ident, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Numero} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Numero", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Numero", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Numero, (yyline + 1), (yycolumn + 1), yytext());
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
            modeloSimbolos.addRow(new Object[]{yytext(), "Cadena", (yyline + 1), (yycolumn + 1)});
            GUI.listaTokens.add(new Token(tmp, "Cadena", (yyline + 1), (yycolumn + 1)));
            return new Symbol(sym.CADENA, (yyline + 1), (yycolumn + 1), tmp);
        }
        . {
            cadena += yytext();
            tamano += yylength();
        }
    }