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

%token halt num reg var set label jump jump_lt add sub begin_vars jump_end_vars
    ffi_call ffi_name ffi_arg1 ffi_arg2

%union {
  long long_val;
  int reg_idx;
  int var_idx;
  char *string_val;
}

%type <long_val> num;
%type <reg_idx> reg;
%type <var_idx> var;
%type <string_val> label;
%type <string_val> ffi_name;

%%

program:
    | program inst
    | program label ':' { insert_label($2, vmcodep); }
    | ;

inst:
    | halt reg { gen_halt_r(&vmcodep, $2); }
    | set reg num { gen_set_rl(&vmcodep, $2, $3); }
    | set reg label { gen_set_rl(&vmcodep, $2, 0); insert_jump($3, vmcodep - 1); }
    | set var num { gen_set_vl(&vmcodep, $2, $3); }
    | set var reg { gen_set_vr(&vmcodep, $2, $3); }
    | jump label { gen_jump_l(&vmcodep, 0); insert_jump($2, vmcodep - 1); }
    | jump reg { gen_jump_r(&vmcodep, $2); }
    | jump_lt label reg num { gen_jump_l_if_r_lt_l(&vmcodep, $2, $3, $4); insert_jump($2, vmcodep - 3); }
    | sub reg var num { gen_sub_rvl(&vmcodep, $2, $3, $4); }
    | add reg reg reg { gen_add_rrr(&vmcodep, $2, $3, $4); }
    | add reg reg num { gen_add_rrl(&vmcodep, $2, $3, $4); }
    | add reg reg var { gen_add_rrv(&vmcodep, $2, $3, $4); }
    | begin_vars num { gen_alloc_v(&vmcodep, $2); }
    | jump_end_vars var { gen_jump_v_dealloc(&vmcodep, $2); }
    | ffi_arg1 reg { gen_ffi_arg1_r(&vmcodep, $2); }
    | ffi_arg2 reg { gen_ffi_arg2_r(&vmcodep, $2); }
    | ffi_call ffi_name { gen_ffi_call(&vmcodep, $2); }
    | ;

%%

int yywrap(void)
{
  return 1;
}

#include "lexer.yy.c"
