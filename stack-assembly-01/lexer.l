%{
/* %option yylineno (flex option, implied by flex -l) */

#include <stdlib.h>
#include <string.h>
char *mystrdup(const char *s)
{
  char *t=malloc(strlen(s)+1);
  return strcpy(t,s);
}
%}

%%
halt return halt;
push return push;
#[0-9]+ { yylval.long_val=strtol(yytext+1,NULL,10); return num; }
[ \t\n]	;
[/][/].*	;
.		yyerror("illegal character"); exit(1);
%%
