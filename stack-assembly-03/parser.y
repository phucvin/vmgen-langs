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

%token halt num delta push label jump_lt add sub call ret

%union {
  long long_val;
  char *string_val;
}

%type <long_val> num;
%type <long_val> delta;
%type <string_val> label;

%%

program:
    | program inst
    | program label ':' { insert_label($2, vmcodep); }
    | ;

inst:
    | halt delta { gen_halt_d(&vmcodep, $2); }
    | ret delta delta { gen_ret_dd(&vmcodep, $2, $3); }
    | push num { gen_push_l(&vmcodep, $2); }
    | jump_lt label delta num { gen_jump_l_if_d_lt_l(&vmcodep, 0, $3, $4); insert_jump($2, vmcodep - 3); }
    | add { gen_add(&vmcodep); }
    | sub delta num { gen_sub_dl(&vmcodep, $2, $3); }
    | call label { gen_call(&vmcodep, 0); insert_jump($2, vmcodep-1); }
    | ;

%%

int yywrap(void)
{
  return 1;
}

#include "lexer.yy.c"
