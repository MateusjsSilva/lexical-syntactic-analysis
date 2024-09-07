import java.nio.file.Files;
import java.nio.file.Paths;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

public class Main {
    public static void main(String[] args) throws Exception {

        // Read the content of the file into a string
        String code = new String(Files.readAllBytes(Paths.get("test/teste.txt")));

        // Create a CharStream that reads from the test file's code
        CharStream input = CharStreams.fromString(code);

        // Create a lexer instance for processing the CharStream input
        SimpAlgLexer lexer = new SimpAlgLexer(input);

        // Create a token stream from the lexer to be used by the parser
        CommonTokenStream tokens = new CommonTokenStream(lexer);

        // Create a parser using the token stream
        SimpAlgParser parser = new SimpAlgParser(tokens);

        // Parse the input starting from the 'program' rule in the grammar
        ParseTree tree = parser.program();

        // Print the parse tree to the console
        System.out.println(tree.toStringTree(parser));
    }
}
