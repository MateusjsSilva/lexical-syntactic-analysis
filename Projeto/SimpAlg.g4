grammar SimpAlg;

// Regra principal do programa
program: 'var' '{' declarations '}' 'program' '{' commands '}';

// Regras para declarações de variáveis
declarations: (variableDeclaration ';')*;

variableDeclaration: type identifierList;

type: 'int' | 'float';

identifierList: identifier (',' identifier)*;

// Regras para comandos do programa
commands: command*;

command: assignment
        | printCommand
        | scanCommand
        | ifElseCommand
        | whileCommand;

// Regra para atribuição de valores a variáveis
assignment: identifier '=' expression ';';

// Regras para comandos de saída de dados
printCommand: 'print' '(' printList ')' ';';

printList: (identifier | STRING) (',' (identifier | STRING))*;

// Regras para comandos de entrada de dados
scanCommand: 'scan' '(' identifierList ')' ';';

// Regras para comandos condicionais
ifElseCommand: 'if' '(' expression ')' '{' commands '}' ('else' '{' commands '}')?;

// Regras para comandos de repetição
whileCommand: 'while' '(' expression ')' '{' commands '}';

// Regras para expressões aritméticas, relacionais e lógicas
expression: atom
          | expression ('*' | '/' | '+' | '-') expression
          | expression ('<' | '<=' | '>' | '>=') expression
          | expression ('==' | '!=') expression
          | '!' expression
          | '(' expression ')';

// Regras para átomos (variáveis, números, strings, valores lógicos)
atom: IDENTIFIER | INT | FLOAT | STRING | 'true' | 'false';

identifier: IDENTIFIER;

// Regras para identificadores (nomes de variáveis)
IDENTIFIER: [A-Za-z][a-zA-Z0-9]*;

// Regra para strings
STRING: '"' (~[\\"\n] | '\\' ["\\])* '"';

// Regra para comentários
COMMENT: '//' ~[\r\n]* -> skip;

// Regra para ignorar espaços em branco, tabulações e quebras de linha
WS: [ \t\r\n]+ -> skip;

// Regras para números
INT: [0-9]+;

FLOAT: [0-9]+ '.' [0-9];