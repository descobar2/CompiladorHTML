/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package compiladorhtml;

import java.io.File;

/**
 *
 * @author niko
 */
public class CompiladorHTML {
    public static void main(String[] args) {
        System.out.println("Log: ");
        String ruta = "src/compiladorhtml/Lexer.flex";
        generarLexer(ruta);
    }
    
    public static void generarLexer(String ruta){
        File archivo = new File(ruta);
        JFlex.Main.generate(archivo);
    }
}
