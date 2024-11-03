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
set return set;
jump return jump;
jump_lt return jump_lt;
add return add;
sub return sub;
begin_vars return begin_vars;
jump_end_vars return jump_end_vars;
#[0-9]+ { yylval.long_val=strtol(yytext+1,NULL,10); return num; }
r[0-9] { yylval.reg_idx=yytext[1]-'0'; return reg; }
v[0-9]+ { yylval.var_idx=strtol(yytext+1,NULL,10); return var; }
@[a-zA-Z\_][a-zA-Z0-9\_]* { yylval.string_val=mystrdup(yytext); return label; }
[ \t\n]	;
[/][/].*	;
.		yyerror("illegal character"); exit(1);
%%
