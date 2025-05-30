package Nodos;

public class Token {
    private String lexema;
    private String tipo;
    private int fila;
    private int columna;

    public Token(String lexema, String tipo, int fila, int columna) {
        this.lexema = lexema;
        this.tipo = tipo;
        this.fila = fila;
        this.columna = columna;
    }
    
    /**
     * @return the lexema
     */
    public String getLexema() {
        return lexema;
    }

    /**
     * @return the tipo
     */
    public String getTipo() {
        return tipo;
    }

    /**
     * @return the fila
     */
    public int getFila() {
        return fila;
    }

    /**
     * @return the columna
     */
    public int getColumna() {
        return columna;
    }
}