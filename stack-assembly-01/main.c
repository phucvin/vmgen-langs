#include <stdlib.h>
#include <string.h>
#include "vm.h"
#include "vm-gen.i"

#define CODE_SIZE 128
#define STACK_SIZE 128
typedef long (*engine_t)(Inst *ip0, Cell *sp, char *fp);

void genarg_i(Inst **vmcodepp, long i)
{
  vm_i2Cell(i, *((Cell *)*vmcodepp));
  (*vmcodepp)++;
}

void printarg_i(long i)
{
  fprintf(vm_out, "%ld ", i);
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
  fprintf(vm_out, "0x%lx ", i.i);
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

void delete_ltab()
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

void insert_lbl(const char *name, Inst *inst)
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

void insert_j(const char *name, Inst *inst)
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
    insert_lbl(name, NULL);
    p = ltab;
  }
  jumptab *jtab = malloc(sizeof(jumptab));
  jtab->next = p->jtab;
  jtab->jump = inst;
  jtab->jump->target = p->start;
  p->jtab = jtab;
}

void gen_code(Inst **p, const char *path)
{
  const char *delimiter_characters = ": \n";
  FILE *input_file = fopen(path, "r");
  char buffer[1024];
  char *token;

  if (input_file == NULL)
  {
    fprintf(stderr, "Unable to open file %s\n", path);
    exit(1);
    return;
  }

#define must_next()                                                      \
  {                                                                      \
    char *last_token = token;                                            \
    token = strtok(NULL, delimiter_characters);                          \
    if (token == NULL)                                                   \
    {                                                                    \
      printf("parse error: expecting something after %s\n", last_token); \
      exit(1);                                                           \
      return;                                                            \
    }                                                                    \
  }

  while (fgets(buffer, 1024, input_file) != NULL)
  {
    // printf("%s\n", buffer);
    token = strtok(buffer, delimiter_characters);
    while (token != NULL)
    {
      if (strcmp(token, "end") == 0)
      {
        gen_end(p);
      }
      else if (strcmp(token, "push") == 0)
      {
        must_next();
        if (token[0] == '#')
        {
          int i = atoi(token + 1);
          gen_push_l(p, i);
        }
        else
        {
          printf("parse error: unexpected %s\n", token);
          exit(1);
          return;
        }
      }
      else if (strcmp(token, "jump") == 0 || strcmp(token, "jump_lt") == 0)
      {
        void (*gen)(Inst **, Cell *);
        if (strcmp(token, "jump") == 0)
        {
          gen = gen_jump_l;
        }
        else if (strcmp(token, "jump_lt") == 0)
        {
          gen = gen_jump_l_if_lt;
        }
        else
        {
          printf("parse error: unexpected token %s\n", token);
          exit(1);
          return;
        }
        must_next();
        if (token[0] == '@')
        {
          gen(p, NULL);
          insert_j(token + 1, (*p) - 1);
        }
        else
        {
          printf("parse error: unexpected %s\n", token);
          exit(1);
          return;
        }
      }
      else if (token[0] == '@')
      {
        insert_lbl(token + 1, *p);
      }
      else
      {
        printf("parse error: unexpected %s\n", token);
        exit(1);
        return;
      }

      token = strtok(NULL, delimiter_characters);
    }
  }

#undef must_next

  if (ferror(input_file))
  {
    perror("The following error occurred");
    exit(1);
    return;
  }

  delete_ltab();
  fclose(input_file);
}

int main(int argc, char **argv)
{
  if (argc < 2)
  {
    printf("Usage: ./vm.out <path to asm file>");
    return 1;
  }
  char *asm_path = argv[1];

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
  gen_code(&vmcodep, asm_path);
  vmcode_end = vmcodep;

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
