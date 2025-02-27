# HyneqLang
A programming language created during the NTI/PRK course at the Technical University of Liberec

# Syntax description

## Literals
In the rest of the syntax description, a literal in general will be defined as `L`.

The following literal types are supported:
  - `true`, `false` - boolean
  - `"Abcd efg, hijk. 123"` or `'Abcd efg, hijk. 123'` - string
  - `123` - int
  - `12.34` or `.5` - float
  - `12e2` or `12.34e3` - float (meaning `12 * 10^2` or `12.34 * 10^3`, respectively)
  - `-123` or `-12.34` - negative number literal, with absolute value and characteristics of the positive numbers defined above

## Variables
A variable name can contain alphanumeric characters (both upper and lower case) and an underscore. It must not start with a number or collide with keywords or boolean values, see below.

Examples of valid variable names:
  - `myvar`
  - `my_var`
  - `myVar`
  - `var12`

The type of variable is not recognized on the syntax level.

In the rest of the syntax description, a variable will be defined as `X`.

## Expressions
In the rest of the syntax description, an expression in general will be defined as `E`.

An expression consists of values, which may have an unary operator attached, and are connected together using binary operators.

A value can be one of the following:
  - `L` - literal
  - `X` - variable
  - `F(E,...)` - function call
  - `(E)` - subexpression

The supported unary operators are:
  - `1!` - factorial
  - `!(E)` - negation of a boolean expression

The supported binary operators are:
  - `X = ...` - assignment
  - `X == X` - equality of variable values
  - `X != X` - nonequality of variable values
  - `X == L` - equality of a variable and a literal
  - `X != L` - nonequality of a variable and a literal
  - `X + X` - determined by variable types
  - `X + L` - determined by symbol and literal type
  - `"a" + "a"` -> `"aa"` - concatenation
  - `1 + 1` -> `2` - sum
  - `1.2 + 2` -> `3.2` - sum
  - `1 - 1` -> `0` - subtraction
  - `1.2 - 2` -> `-0.8` - subtraction
  - `2 * 3` -> `6` - multiplication
  - `1.2 * 2` -> `2.4` - multiplication
  - `3^2` - power

If there are more than two values connected together using operators, the following rules (in the specified order) apply:
  1. the priority of operators - `^` > `*` > `+` `-` > `==` `!=` > `=`
  2. left-to-right processing

## Statements and blocks
The program consists of a sequence of statements and blocks. A block contains a nested sequence of statements and blocks.

A statement is a standalone expression terminated by `;`.

A block consists of keywords, expressions (`E`) and nested sequences of statements and blocks (`S`).

The following code flow blocks are recognized:
  - `if (E) {S}` - if clause
  - `if (E) {S} else {S}` - if clause with else
  - `if (E) {S} elif {S}` - if clause with else-if
  - `if (E) {S} elif (E) {S} else {S}` - if clause with else-if and else
  - `while (E) {S}` - while clause

A function is defined as `fun(X,...) {Sf}`, where `Sf` is an extension of `S`, with added `return E;` statement allowed in it or nested code flow blocks, to end the function's execution and return the value from the specified expression.
