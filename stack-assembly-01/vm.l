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
[-()+,<;]	return yytext[0];
func	return FUNC;
return	return RETURN;
end	return END;
if	return IF;
then	return THEN;
else	return ELSE;
[0-9]+			{ yylval.num=strtol(yytext,NULL,10); return NUM; }
[a-zA-Z\_][a-zA-Z0-9\_]*	{ yylval.string=mystrdup(yytext); return IDENT; }
[ \t\n]	;
[/][/].*	;
.		yyerror("illegal character"); exit(1);
%%
