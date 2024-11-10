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
[:] return yytext[0];
halt return halt;
push return push;
call return call;
ret return ret;
jump_lt return jump_lt;
add return add;
sub return sub;
#[0-9]+ { yylval.long_val=strtol(yytext+1,NULL,10); return num; }
~[0-9]+ { yylval.long_val=strtol(yytext+1,NULL,10); return delta; }
@[a-zA-Z\_][a-zA-Z0-9\_]* { yylval.string_val=mystrdup(yytext); return label; }
@@[a-zA-Z\_][a-zA-Z0-9\_]* { yylval.string_val=mystrdup(yytext); return label; }
[ \t\n]	;
[/][/].*	;
.		{ yyerror("illegal character"); printf("character: %s",  yytext); exit(1); }
%%
