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

%token halt num reg push pop set label jump jump_tos jump_lt add sub

%union {
  long long_val;
  int reg_idx;
  char *string_val;
}

%type <long_val> num;
%type <reg_idx> reg;
%type <string_val> label;

%%

program:
    | program inst
    | program label ':' { insert_label($2, vmcodep); }
    | ;

inst:
    | halt reg { gen_halt_r(&vmcodep, $2); }
    | set reg num { gen_set_rl(&vmcodep, $2, $3); }
    | push reg { gen_push_r(&vmcodep, $2); }
    | push label { gen_push_l(&vmcodep, 0); insert_jump($2, vmcodep - 1); }
    | pop reg { gen_pop_r(&vmcodep, $2); }
    | jump label { gen_jump_l(&vmcodep, 0); insert_jump($2, vmcodep - 1); }
    | jump_tos { gen_jump_tos(&vmcodep); }
    | jump_lt label reg num { gen_jump_l_if_r_lt_l(&vmcodep, $2, $3, $4); insert_jump($2, vmcodep - 3); }
    | sub reg reg num { gen_sub_rrl(&vmcodep, $2, $3, $4); }
    | add reg reg reg { gen_add_rrr(&vmcodep, $2, $3, $4); }
    | ;

%%

int yywrap(void)
{
  return 1;
}

#include "lexer.yy.c"
