# HyneqLang
A programming language created during the NTI/PRK course at the Technical University of Liberec

# Syntax description

## Literals
A literal in general will later be specified as `L`.

The following literal types are supported:
  - `true`, `false` - boolean (later specified as `B`)
  - `"Abcd efg, hijk. +-123"` or `'Abcd efg, hijk. +-123'` - string (later specified as `S`)
  - `123` - int
  - `12.34` or `.5` - float
  - `12e2` or `12.34e3` - float (meaning `12 * 10^2` or `12.34 * 10^3`, respectively)
  - `-123` or `-12.34` - negative number literal, with absolute value and characteristics of the positive numbers defined above

Numbers in general will later be specified as `N`.

## Variables
A variable name can contain alphanumeric characters (both upper and lower case) and an underscore. It must not start with a number or collide with keywords or boolean values, see below.

Examples of valid variable names:
  - `myvar`
  - `my_var`
  - `myVar`
  - `var12`

The type of variable is not recognized on the syntax level.

A variable will later be specified as `X`.

## Expressions
An expression in general will later be specified as `E`.

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
  - `E & E` - logical and
  - `E | E` - logical or
  - `E && E` - logical and which stops at false value
  - `E || E` - logical or which stops at true value
  - `E == E` - equality of expression values
  - `E == E` - equality of expression values
  - `E != E` - nonequality of expression values
  - `E == L` - equality of an expression and a literal
  - `E != L` - nonequality of an expression and a literal
  - `E > E` - higher than for supported expression values
  - `E < E` - lower than for supported expression values
  - `E >= E` - higher than or equal for supported expression values
  - `E <= E` - lower than or equal for supported expression values
  - `E > N` - higher than a number literal
  - `E < E` - lower than a number literal
  - `E >= E` - higher than or equal to a number literal
  - `E <= E` - lower than or equal to a number literal
  - `E + X` - determined by expression result type
  - `E + L` - determined by expression result and literal type
  - `"a" + "a"` -> `"aa"` - concatenation
  - `1 + 1` -> `2` - sum
  - `1.2 + 2` -> `3.2` - sum
  - `1 - 1` -> `0` - subtraction
  - `1.2 - 2` -> `-0.8` - subtraction
  - `2 * 3` -> `6` - multiplication
  - `1.2 * 2` -> `2.4` - multiplication
  - `3^2` - power
  - `E^2` - power of expression result

If there are more than two values are connected together using operators at the same bracket level, the following rules (in the specified order) apply:
  1. the priority of operators - `^` > `*` > `+` `-` > `==` `!=` > `&` `|` > `&&` `||` > `=`
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
