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

%token halt num push

%union {
  long long_val;
}

%type <long_val> num;

%%

program:
    | program inst
    | ;

inst:
    | halt { gen_end(&vmcodep); }
    | push num { gen_push_l(&vmcodep, $2); }
    | ;

%%

int yywrap(void)
{
  return 1;
}

#include "lexer.yy.c"
