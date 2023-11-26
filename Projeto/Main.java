import java.nio.file.Files;
import java.nio.file.Paths;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.ParseTree;

public class Main {
    public static void main(String[] args) throws Exception {

        String code = new String(Files.readAllBytes(Paths.get("test/teste.txt")));

        // cria um CharStream que lê do código de teste
        CharStream input = CharStreams.fromString(code);

        // cria um lexer que alimenta fora do CharStream
        SimpAlgLexer lexer = new SimpAlgLexer(input);

        // cria um buffer de tokens puxados do lexer
        CommonTokenStream tokens = new CommonTokenStream(lexer);

        // imprime todos os tokens
        tokens.fill();
        for (Token token : tokens.getTokens()) {
            System.out.println(token.toString());
        }

        // cria um parser que alimenta fora do buffer de tokens
        SimpAlgParser parser = new SimpAlgParser(tokens);

        // começa a análise na regra init
        ParseTree tree = parser.program();

        // imprime a árvore de análise no console
        System.out.println(tree.toStringTree(parser));
    }
}
