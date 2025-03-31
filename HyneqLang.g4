grammar HyneqLang;

/** LEXER RULES **/

// Whitespace
WS: [ \t\r\n]+ -> skip;

// LITERALS

// Boolean
TRUE: 'true';
FALSE: 'false';

// Numbers
fragment Digit: [0-9];
fragment Digits: Digit+;
fragment Sign: [+-]?;
fragment IntPart: Digits;
fragment DecimalPart: '.' Digits;
Int: Sign IntPart;
Decimal: Sign IntPart? DecimalPart;

// Strings
fragment StringCharacter: ~["'\\\r\n];
fragment StringCharacters: StringCharacter+;
fragment DoubleQuotedString: '"' StringCharacters '"';
fragment SingleQuotedString: '\'' StringCharacters '\'';
String: DoubleQuotedString | SingleQuotedString;

// Variables
Variable: [a-zA-Z_][a-zA-Z0-9_]*;


/* GRAMMAR RULES */

// Top-level program
program: statementList EOF;


// LITERALS

// Boolean
boolean: TRUE | FALSE;

// Numbers
number: Int | Decimal;

// A literal in general
literal: boolean | number | String;


// EXPRESSIONS
expression: binary6Expression;

enclosedExpression: '(' expression ')';
atomExpression: literal | Variable | functionCall | enclosedExpression;

// Function calls
functionArgs: (expression (',' expression)* )?;
functionCall: Variable '(' functionArgs ')';

// Unary operators
factorial: atomExpression '!';
negation: '!' enclosedExpression;
unaryExpression: atomExpression | factorial | negation;

// Binary operators level 0
power: unaryExpression '^' binary0Expression;
binary0Expression: unaryExpression | power;

// Binary operators level 1
multiplication: binary0Expression '*' binary1Expression;
binary1Expression: binary0Expression | multiplication;

// Binary operators level 2
sum: binary1Expression '+' binary2Expression;
diff: binary1Expression '-' binary2Expression;
binary2Expression: binary1Expression | sum | diff;

// Binary operators level 3
equalComparison: binary2Expression '==' binary3Expression;
nonequalComparison: binary2Expression '!=' binary3Expression;
greaterThanComparison: binary2Expression '>' binary3Expression;
lowerThanComparison: binary2Expression '<' binary3Expression;
greaterThanOrEqualComparison: binary2Expression '>=' binary3Expression;
lowerThanOrEqualComparison: binary2Expression '<=' binary3Expression;
binary3Expression: binary2Expression | equalComparison | nonequalComparison | greaterThanComparison | lowerThanComparison | greaterThanOrEqualComparison | lowerThanOrEqualComparison;

// Binary operators level 4
conjunction: binary3Expression '&' binary4Expression;
disjunction: binary3Expression '|' binary4Expression;
binary4Expression: binary3Expression | conjunction | disjunction;

// Binary operators level 5
stopConjunction: binary4Expression '&&' binary5Expression;
stopDisjunction: binary4Expression '||' binary5Expression;
binary5Expression: binary4Expression | stopConjunction | stopDisjunction;

// Binary operators level 6
assignment: Variable '=' binary6Expression;
binary6Expression: binary5Expression | assignment;


// STATEMETS AND BLOCKS
expressionStatement: expression ';';
returnExpressionStatement: 'return' expression ';';
simpleStatement: expressionStatement | returnExpressionStatement;

blockStatement: ifClause | whileClause | functionDeclaration;

statement: simpleStatement | blockStatement;
statementList: (statement)*;
enclosedStatementList: '{' statementList '}';

// If clause
ifHeader: 'if' enclosedExpression;
elifHeader: 'elif' enclosedExpression;
elseHeader: 'else';

ifPart: ifHeader enclosedStatementList;
elifPart: elifHeader enclosedStatementList;
elsePart: elseHeader enclosedStatementList;

ifClause: ifPart (elifPart)* (elsePart)?;

// While clause
whileHeader: 'while' enclosedExpression;

whileClause: whileHeader enclosedStatementList;

// Function declaration
functionDeclarationArgs: (Variable (',' Variable)* )?;
functionDeclarationHeader: 'fun' Variable '(' functionDeclarationArgs ')';
functionDeclaration: functionDeclarationHeader enclosedStatementList;
