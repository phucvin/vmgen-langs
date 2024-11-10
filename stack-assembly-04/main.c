#include <stdlib.h>
#include <string.h>
#include "vm.h"

#define CODE_SIZE 128
#define STACK_SIZE 1024
typedef long (*engine_t)(Inst *ip0, Cell *sp, Cell *fp);

void genarg_i(Inst **vmcodepp, long long i)
{
  vm_i2Cell(i, *((Cell *)*vmcodepp));
  (*vmcodepp)++;
}

void printarg_i(long long i)
{
  fprintf(vm_out, "%lld ", i);
}

void genarg_target(Inst **vmcodepp, Inst *target)
{
  vm_target2Cell(target, *((Cell *)*vmcodepp));
  (*vmcodepp)++;
}
void printarg_target(Inst *target)
{
  fprintf(vm_out, "%p ", target);
}

void printarg_Cell(Cell i)
{
  fprintf(vm_out, "0x%llx ", i.i);
}

Label *vm_prim;
Inst *vmcodep;
FILE *vm_out;
int vm_debug;

typedef struct jumptab
{
  struct jumptab *next;
  Inst *jump;
} jumptab;

typedef struct lbltab
{
  struct lbltab *next;
  char *name;
  Inst *start;
  struct jumptab *jtab;
} lbltab;

lbltab *ltab = NULL;

void delete_labeltab()
{
  lbltab *p = ltab;
  while (p != NULL)
  {
    jumptab *j = p->jtab;
    while (j != NULL)
    {
      jumptab *tmp = j;
      j = j->next;
      free(tmp);
    }
    p->jtab = NULL;
    lbltab *tmp = p;
    p = p->next;
    free(tmp);
  }
  ltab = NULL;
}

void insert_label(const char *name, Inst *inst)
{
  lbltab *p;
  for (p = ltab; p != NULL; p = p->next)
  {
    if (strcmp(p->name, name) == 0)
    {
      break;
    }
  }
  if (p == NULL)
  {
    p = malloc(sizeof(lbltab));
    if (p->start != NULL)
    {
      printf("redefined label %s", name);
      exit(1);
    }
    p->next = ltab;
    p->start = inst;
    p->jtab = NULL;
    ltab = p;
  }
  p->name = name != NULL ? strdup(name) : NULL;
  p->start = inst;
  if (p->jtab != NULL)
  {
    jumptab *j = p->jtab;
    while (j != NULL)
    {
      j->jump->target = p->start;
      j = j->next;
    }
  }
}

void insert_jump(const char *name, Inst *inst)
{
  lbltab *p;
  for (p = ltab; p != NULL; p = p->next)
  {
    if (strcmp(p->name, name) == 0)
    {
      break;
    }
  }
  if (p == NULL)
  {
    insert_label(name, NULL);
    p = ltab;
  }
  jumptab *jtab = malloc(sizeof(jumptab));
  jtab->next = p->jtab;
  jtab->jump = inst;
  jtab->jump->target = p->start;
  p->jtab = jtab;
}

int main(int argc, char **argv)
{
  if (argc != 2)
  {
    printf("Usage: ./vm.out <path to asm file>");
    return 1;
  }

  Inst *vm_code = (Inst *)calloc(CODE_SIZE, sizeof(Inst));
  Inst *start;
  Cell *stack = (Cell *)calloc(STACK_SIZE, sizeof(Cell));
  engine_t runvm;
#ifdef VM_DEBUG
  runvm = engine_debug;
  vm_debug = 1;
#else
  runvm = engine;
  vm_debug = 0;
#endif

  vmcodep = vm_code;
  vm_out = stderr;
  (void)runvm(NULL, NULL, NULL); /* initialize vm_prim */
  init_peeptable();

  start = vmcodep;
  // Parse and generate code at the same time
  if ((yyin = fopen(argv[1], "r")) == NULL) {
    perror(argv[1]);
    exit(1);
  }
  if (yyparse())
  {
    exit(1);
  }
  vmcode_end = vmcodep;
  delete_labeltab();

  printf("\nvm assembly:\n");
  vm_disassemble(vm_code, vmcodep, vm_prim);

  printf("\nvm run:\n");
  long return_code = runvm(start, stack + STACK_SIZE - 1, NULL);
  printf("%sreturn code: %ld\n", vm_debug ? "\n" : "", return_code);

#ifdef VM_PROFILING
  printf("\nvm profiling:\n");
  vm_print_profile(vm_out);
#endif

  return 0;
}
