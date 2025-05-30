package nodos;

public class NodoError {

    private String simbolo;
    private int fila;
    private int columna;
    private String tipo;
    private String descripcion;

    public NodoError(String simbolo, int fila, int columna, String tipo, String descripcion) {
        this.simbolo = simbolo;
        this.fila = fila;
        this.columna = columna;
        this.tipo = tipo;
        this.descripcion = descripcion;
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

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @return the simbolo
     */
    public String getSimbolo() {
        return simbolo;
    }

    /**
     * @return the tipo
     */
    public String getTipo() {
        return tipo;
    }
}
