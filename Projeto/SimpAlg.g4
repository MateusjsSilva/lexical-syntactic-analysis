grammar SimpAlg;

// Um programa é composto por uma seção de variáveis e uma seção de programa
program: varSection programSection EOF;

// Seção de variáveis contém declarações de variáveis
varSection: 'var' '{' varDeclaration* '}';

// Cada declaração de variável termina com um ponto e vírgula
varDeclaration: variableDeclaration ';';

// Uma declaração de variável é composta por um tipo e uma lista de identificadores
variableDeclaration: type identifierList;

// Os tipos suportados são int e float
type: 'int' | 'float';

// Uma lista de identificadores é composta por um ou mais IDs separados por vírgulas
identifierList: ID (',' ID)*;

// A seção do programa contém comandos
programSection: 'program' '{' command* '}';

// Um comando pode ser um dos seguintes
command:
	printCommand
	| scanCommand
	| assignment
	| ifCommand
	| whileCommand;

// Comando de impressão
printCommand: 'print' '(' printList ')' ';';

// Lista de impressão
printList: (ID | STRING | INT | FLOAT) (
		',' (ID | STRING | INT | FLOAT)
	)*;

// Comando de leitura
scanCommand: 'scan' '(' scanList ')' ';';

// Lista de leitura
scanList: ID (',' ID)*;

// Atribuição
assignment: ID '=' arithExpr ';';

// Comando if
ifCommand:
	'if' '(' boolExpr ')' '{' command* '}' (
		'else' '{' command* '}'
	)?;

// Comando while
whileCommand: 'while' '(' boolExpr ')' '{' command* '}';

// Expressão aritmética
arithExpr:
	<assoc = right> arithExpr ('*' | '/') arithExpr
	| <assoc = right> arithExpr ('+' | '-') arithExpr
	| <assoc = right> arithExpr '%' arithExprInt
	| '(' arithExpr ')'
	| ('-' | '+')? (INT | FLOAT | ID);

// Expressão aritmética (para INT)
arithExprInt:
	<assoc = right> arithExprInt ('*' | '/') arithExprInt
	| <assoc = right> arithExprInt ('+' | '-') arithExprInt
	| <assoc = right> arithExprInt '%' arithExprInt
	| '(' arithExprInt ')'
	| ('-' | '+')? (INT | ID);

// Expressão booleana
boolExpr:
    boolExpr ('and' | 'or') boolExpr
    |'(' boolExpr ')'
	| '!' boolExpr
	| (INT | FLOAT | ID) relOp (INT | FLOAT | ID);

// Operadores relacionais
relOp: '>=' | '<=' | '<' | '>' | '==' | '!=';

// Identificador
ID: [a-zA-Z][a-zA-Z0-9]*;

// Inteiro
INT: [0-9]+;

// Float
FLOAT: [0-9]+ '.' [0-9]*;

// String
STRING: '"' (~["\r\n\\] | '\\' .)* '"';

// Comentário
COMMENT: '//' ~[\r\n]* -> skip;

// Espaço em branco
WS: [ \t\r\n]+ -> skip;