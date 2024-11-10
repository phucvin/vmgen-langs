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

%token halt num frame push label jump_lt add sub call ret alloc store load

%union {
  long long_val;
  char *string_val;
}

%type <long_val> num;
%type <long_val> frame;
%type <string_val> label;

%%

program:
    | program inst
    | program label ':' { insert_label($2, vmcodep); }
    | ;

inst:
    | halt { gen_halt(&vmcodep); }
    | alloc num { gen_alloc(&vmcodep, $2); }
    | ret { gen_ret(&vmcodep); }
    | ret frame { gen_ret_f(&vmcodep, $2); }
    | push num { gen_push_l(&vmcodep, $2); }
    | jump_lt label frame num { gen_jump_l_if_f_lt_l(&vmcodep, 0, $3, $4); insert_jump($2, vmcodep - 3); }
    | jump_lt label { gen_jump_lt(&vmcodep, 0); insert_jump($2, vmcodep - 1); }
    | add { gen_add(&vmcodep); }
    | add frame frame { gen_add_ff(&vmcodep, $2, $3); }
    | sub { gen_sub(&vmcodep); }
    | sub frame num { gen_sub_fl(&vmcodep, $2, $3); }
    | call label num { if ($3 == 1) { gen_call1(&vmcodep, 0); insert_jump($2, vmcodep-1); } else { printf("unimplemented"); exit(1); } }
    | store frame { gen_store(&vmcodep, $2); }
    | load frame { gen_load(&vmcodep, $2); }
    | ;

%%

int yywrap(void)
{
  return 1;
}

#include "lexer.yy.c"
