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
    Punto = "."
    PuntoComa = ";"
    Admiracion = "!"    
    Pipe = "|"
    CierreDiag = "/"
    AperturaE = "("
    CierreE = ")"
    LlaveA = "{"
    LlaveC = "}"
    CorcheteA = "["
    CorcheteC = "]"
    
//---RESERVADAS (orden importante: más específicas primero)
    Public = "public"
    Class = "class"
    Let = "let"
    Private = "private"
    String = "String"
    Connection = "Connection"
    Try = "try"
    Catch = "catch"
    Class = "Class"
    ForName = "forName"
    DriverManager = "DriverManager"
    GetConnection = "getConnection"
    ClassNotFoundException = "ClassNotFoundException"
    SQLException = "SQLException"
    PrintStackTrace = "printStackTrace"
    Return = "return"
    Static = "static"
    Void = "void"
    Main = "main"
    Args = "args"
    ConnectionMysql = "ConnectionMysql"
    New = "new"
    If = "if"
    Else = "else"
    Null = "null"
    System = "System"
    Out = "Out"
    Println = "println"

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
    <YYINITIAL> {Punto} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Punto", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Punto", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Punto, (yyline + 1), (yycolumn + 1), yytext());
    }    
    <YYINITIAL> {PuntoComa} {
        modeloSimbolos.addRow(new Object[]{yytext(), "PuntoComa", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "PuntoComa", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.PuntoComa, (yyline + 1), (yycolumn + 1), yytext());
    }    
    <YYINITIAL> {Admiracion} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Admiracion", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Admiracion", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Admiracion, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Pipe} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Pipe", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Pipe", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Pipe, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {CierreDiag} {
        modeloSimbolos.addRow(new Object[]{yytext(), "CierreDiag", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "CierreDiag", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.CierreDiag, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {AperturaE} {
        modeloSimbolos.addRow(new Object[]{yytext(), "AperturaE", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "AperturaE", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.AperturaE, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {CierreE} {
        modeloSimbolos.addRow(new Object[]{yytext(), "CierreE", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "CierreE", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.CierreE, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {LlaveA} {
        modeloSimbolos.addRow(new Object[]{yytext(), "LlaveA", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "LlaveA", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.LlaveA, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {LlaveC} {
        modeloSimbolos.addRow(new Object[]{yytext(), "LlaveC", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "LlaveC", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.LlaveC, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {CorcheteA} {
        modeloSimbolos.addRow(new Object[]{yytext(), "CorcheteA", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "CorcheteA", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.CorcheteA, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {CorcheteC} {
        modeloSimbolos.addRow(new Object[]{yytext(), "CorcheteC", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "CorcheteC", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.CorcheteC, (yyline + 1), (yycolumn + 1), yytext());
    }

//---RESERVADAS (orden importante: palabras más específicas primero)
    <YYINITIAL> {Public} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Public, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Class} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Class, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Let} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Let, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Private} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Private, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {String} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.String, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Connection} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Connection, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Try} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Try, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Catch} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Catch, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {ForName} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.ForName, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {DriverManager} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.DriverManager, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {GetConnection} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.GetConnection, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {ClassNotFoundException} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.ClassNotFoundException, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {SQLException} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.SQLException, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {PrintStackTrace} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.PrintStackTrace, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Return} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Return, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Static} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Static, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Void} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Void, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Main} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Main, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Args} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Args, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {ConnectionMysql} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.ConnectionMysql, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {New} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.New, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {If} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.If, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Else} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Else, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Null} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Null, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {System} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.System, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Out} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Out, (yyline + 1), (yycolumn + 1), yytext());
    }
    <YYINITIAL> {Println} {
        modeloSimbolos.addRow(new Object[]{yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)});
        GUI.listaTokens.add(new Token(yytext(), "Palabra reservada", (yyline + 1), (yycolumn + 1)));
        return new Symbol(sym.Println, (yyline + 1), (yycolumn + 1), yytext());
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