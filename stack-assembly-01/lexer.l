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
[0-9]+			{ yylval.num=strtol(yytext,NULL,10); return NUM; }
[ \t\n]	;
[/][/].*	;
.		yyerror("illegal character"); exit(1);
%%
