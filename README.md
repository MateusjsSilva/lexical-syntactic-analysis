# SimpAlg Language Parser

This project defines a simple programming language called **SimpAlg**, which supports basic variable declarations, control structures, and arithmetic/boolean expressions. The project uses ANTLR to generate a lexer and parser based on the defined grammar.

## Overview

The **SimpAlg** language consists of two main sections:
1. **Variable Declarations** - where variables of type `int` and `float` are declared.
2. **Program Commands** - where the main logic of the program is defined with commands such as printing, reading input, conditional statements (`if`), loops (`while`), and assignments.

The language supports arithmetic and boolean expressions, basic I/O operations, and standard control flow structures.

## Grammar Structure

The grammar for **SimpAlg** is written in ANTLR and defines the following:
- Variable declarations (supporting `int` and `float` types).
- Basic commands including `print`, `scan`, assignments, conditionals (`if`), and loops (`while`).
- Arithmetic and boolean expressions with standard operators.

## Installation

### Prerequisites

- **Java** (version 8 or higher)
- **ANTLR** (version 4)

### Steps

1. **Install ANTLR:**
   Follow the official installation guide for [ANTLR](https://www.antlr.org/).

2. **Generate Lexer and Parser:**
   After cloning the repository, generate the lexer and parser using ANTLR:
   ```bash
   antlr4 SimpAlg.g4
   ```

3. **Compile the Java Code:**
   ```bash
   javac Main.java
   ```

4. **Run the Main Program:**
   ```bash
   java Main
   ```

## Usage

1. Write your SimpAlg program in a file, for example teste.txt.
2. Run the main program to parse and analyze the code.
3. The program will output the parse tree in the console.

## Contribution

Feel free to open issues or submit pull requests. All contributions are welcome!

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.