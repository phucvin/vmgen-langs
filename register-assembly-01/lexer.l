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
pop return pop;
set return set;
jump return jump;
jump_tos return jump_tos;
jump_lt return jump_lt;
add return add;
sub return sub;
#[0-9]+ { yylval.long_val=strtol(yytext+1,NULL,10); return num; }
r[0-9] { yylval.reg_idx=yytext[1]-'0'; return reg; }
@[a-zA-Z\_][a-zA-Z0-9\_]* { yylval.string_val=mystrdup(yytext); return label; }
[ \t\n]	;
[/][/].*	;
.		yyerror("illegal character"); exit(1);
%%
