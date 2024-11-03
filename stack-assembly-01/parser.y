%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "vm.h"

void yyerror(char *s)
{
#if 1
  /* for pure flex call */
  fprintf(stderr, "%s\n", s);
#else
  /* lex or flex -l supports yylineno */
  fprintf (stderr, "%d: %s\n", yylineno, s);
#endif
}

#include "vm-gen.i"

int yylex();
%}

%token halt num push label jump jump_lt

%union {
  long long_val;
  char *string_val;
}

%type <long_val> num;
%type <string_val> label;

%%

program:
    | program inst
    | program label ':' { insert_label($2, vmcodep); }
    | ;

inst:
    | halt { gen_end(&vmcodep); }
    | push num { gen_push_l(&vmcodep, $2); }
    | jump label { gen_jump_l(&vmcodep, 0); insert_jump($2, vmcodep - 1); }
    | jump_lt label { gen_jump_l_if_lt(&vmcodep, 0); insert_jump($2, vmcodep - 1); }
    | ;

%%

int yywrap(void)
{
  return 1;
}

#include "lexer.yy.c"
