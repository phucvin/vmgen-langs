#include <stdlib.h>
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

Label *vm_prim;
Inst *vmcodep;
FILE *vm_out;
int vm_debug;

int main(int argc, char **argv)
{
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
  // Generate bytecode directly here for now
  {
    // main
    // call fib(n) with param n in r0 and return address in stack
    gen_push_l(&vmcodep, (long int)(char *)start + 56);
    gen_set_rl(&vmcodep, 0, 2);
    gen_jump_l(&vmcodep, (Cell *)((char *)start + 80));
    // result is now in r0
    gen_push_r(&vmcodep, 0);
    gen_end(&vmcodep);

    // fib
    // param n is in r0, return address in stack
    gen_jump_l_if_r_lt_l(&vmcodep, (Cell *)((char *)start + 144), 0, 2);
    gen_add_rrl(&vmcodep, 0, 0, 100); // TODO: handle recursive case
    gen_jump(&vmcodep);
    // base case
    // result is also n, which is already in r0
    gen_jump(&vmcodep);
  }
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
