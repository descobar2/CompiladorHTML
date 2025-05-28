/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package compiladorhtml;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 *
 * @author niko
 */
public class CompiladorHTML {
    public static void main(String[] args) throws Exception {
        System.out.println("Log: ");
        String ruta1 = "src/compiladorhtml/Lexer.flex";
        String ruta2 = "src/compiladorhtml/LexerCup.flex";
        String[] rutaS = {"-parser", "Sintax", "src/compiladorhtml/Sintax.cup"};
                
        generar(ruta1,ruta2,rutaS);
    }
    
    public static void generar(String ruta1,String ruta2, String[] rutaS ) throws IOException, Exception{
        File archivo;
        archivo = new File(ruta1);
        JFlex.Main.generate(archivo);
/*       
        Path rutaLexer = Paths.get("src/compiladorhtml/Lexer.java");
        if (Files.exists(rutaLexer)){
            Files.delete(rutaLexer);
        }        
        Files.move(
            Paths.get("Lexer.java"),
            Paths.get("src/compiladorhtml/Lexer.java")
        );
*/
        archivo = new File(ruta2);
        JFlex.Main.generate(archivo);
        Path rutaSym = Paths.get("src/compiladorhtml/sym.java");
        if (Files.exists(rutaSym)){
            Files.delete(rutaSym);
        }
        Files.move(
            Paths.get("sym.java"),
            Paths.get("src/compiladorhtml/sym.java")
        );
        
        java_cup.Main.main(rutaS);
        Path rutaSin = Paths.get("src/compiladorhtml/Sintax.java");
        if (Files.exists(rutaSin)){
            Files.delete(rutaSin);
        }
        Files.move(
            Paths.get("Sintax.java"),
            Paths.get("src/compiladorhtml/Sintax.java")
        );
    }
}
