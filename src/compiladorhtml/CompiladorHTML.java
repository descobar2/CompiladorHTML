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
        generar();
    }

    public static void generar() throws IOException, Exception {
        try {
            String ruta = "src/compiladorhtml/"; //RUTA DE ARCHIVOS .JFLEX Y .CUP
            String opcFlex[] = {ruta + "Lexer.flex", "-d", ruta};
            JFlex.Main.generate(opcFlex);
            String opcCUP[] = {"-expect", "6", "-destdir", ruta, "-parser", "parser", ruta + "Sintax.cup"};
            java_cup.Main.main(opcCUP);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
