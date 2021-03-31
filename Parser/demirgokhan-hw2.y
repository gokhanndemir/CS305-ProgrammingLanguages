%{ /* C declarations */
#include <stdio.h>
void yyerror (char* msg)
{
// no need to print.
    return;
}
%}
/* Bison declarations start below */
%start prog
/* token part is used to declare tokens that will be used in the grammar part below. */
%token tSTRING tNUM tPRINT tGET tSET tFUNCTION tRETURN tIDENT tEQUALITY tIF tGT tLT tGEQ tLEQ tINC tDEC

%% /* Grammar rules start below */
prog:	     '[' ']'
	| '[' stmtlst ']'
;

stmtlst: stmtlst stmt
	| stmt
;

stmt:	set
	| print
	| if
	| dec
	| inc
	| rtrn
	| expr
;

set:	'[' tSET ',' tIDENT ',' expr ']'
;

if:		'[' tIF ',' cond ',' '[' stmtlst ']' ']'
		| '[' tIF ',' cond ',' '[' stmtlst ']' '[' stmtlst ']' ']'
;

print:		'[' tPRINT ',' '[' expr ']' ']'
		;

inc:		'[' tINC ',' tIDENT ']'
		;

dec:		'[' tDEC ',' tIDENT ']'
		;

cond:		'[' conds ',' expr ',' expr ']'
;

conds:	  tGT
	| tLT
        | tGEQ
        | tLEQ
        | tEQUALITY
;

expres:	expres ',' expr
		| expr
		;

expr:	tNUM
		| tSTRING
		| get
		| func
		| operation
		| cond
		;

get:		'[' tGET ',' tIDENT ']'
		| '[' tGET ',' tIDENT ',' '[' expres ']' ']'
		| '[' tGET ',' tIDENT ',' '[' ']' ']'
		;

params:		params ',' tIDENT
		| tIDENT
		;

func:		'[' tFUNCTION ',' '[' params ']' ',' '[' stmtlst ']' ']'
		| '[' tFUNCTION ',' '[' ']' ',' '[' stmtlst ']' ']'
		| '[' tFUNCTION ',' '[' ']' ',' '[' ']' ']'
		;

operators:	'"''+''"'
		| '"''-''"'
		| '"''*''"'
		| '"''/''"'           
		;

operation:	'[' operators ',' expr ',' expr ']'
		;

rtrn:		'[' tRETURN ']'
		| '[' tRETURN ',' expr ']'
		;
%%
int main()
{
    if (yyparse())
    {
         // parse error
         printf("ERROR\n");
         return 1;
    }
    else
    {
         // successful parsing
         printf("OK\n");
         return 0;
    }
}