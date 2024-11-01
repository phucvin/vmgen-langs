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

void printarg_Cell(Cell i)
{
  fprintf(vm_out, "0x%lx ", i.i);
}

Inst *vmcodestart;
Label *vm_prim;
Inst *vmcodep;
FILE *vm_out;
int vm_debug;

void gen_code(Inst **p, const char *path)
{
  const char *delimiter_characters = " ";
  FILE *input_file = fopen(path, "r");
  char buffer[1024];
  char *token;

  if (input_file == NULL)
  {
    fprintf(stderr, "Unable to open file %s\n", path);
    exit(1);
    return;
  }

  while (fgets(buffer, 1024, input_file) != NULL)
  {
    token = strtok(buffer, delimiter_characters);
    while (token != NULL)
    {
      // printf("%s\n", last_token);
      if (strcmp(token, "end") == 0) {
        gen_end(p);
      }
      else if (strcmp(token, "push") == 0) {
        token = strtok(NULL, delimiter_characters);
        if (token == NULL) {
          printf("parse error: expecting something after push");
          exit(1);
          return;
        }
        if (token[0] == '#') {
          int i = atoi(token + 1);
          gen_push_l(p, i);
        }
      }

      token = strtok(NULL, delimiter_characters);
    }
  }
  if (ferror(input_file))
  {
    perror("The following error occurred");
    exit(1);
    return;
  }

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
  vmcodestart = vm_code;
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
