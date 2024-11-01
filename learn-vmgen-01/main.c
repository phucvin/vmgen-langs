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

void printarg_Cell(Cell i)
{
  fprintf(vm_out, "0x%lx ", i.i);
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
  int code = 0;
  if (code == 2) {
    gen_set_r0l(&vmcodep, 0);
    gen_set_r1l(&vmcodep, 1);
    gen_add_r0r0r1(&vmcodep);
    gen_jump_l_if_r0_lt_l(&vmcodep, (Cell *)((char *)start + 16), 1000000000);
    gen_push_r0(&vmcodep);
    gen_end(&vmcodep);
  }
  if (code == 1) {
    gen_set_rl(&vmcodep, 0, 0);
    gen_add_rrl(&vmcodep, 0, 0, 1);
    gen_jump_l_if_r_lt_l(&vmcodep, (Cell *)((char *)start + 24), 0, 1000000000);
    gen_push_r(&vmcodep, 0);
    gen_end(&vmcodep);
  }
  if (code == 0) {
    // main
    // call fib(n) with param n in r0 and return address in stack
    gen_set_rl(&vmcodep, 0, 4);
    gen_set_rl(&vmcodep, 9, (long int)(char *)start + 64);
    gen_jump_l(&vmcodep, (Cell *)((char *)start + 80));
    // result is now in r0
    gen_end_r(&vmcodep, 0);

    // fib
    // param n is in r0, return address in stack
    // if n < 0, jump to base case; fallthrough if not
    gen_jump_l_if_r_lt_l(&vmcodep, (Cell *)((char *)start + 400), 0, 2);
    // recursive case
    // allocate spaces for variables (won't change when making calls)
    gen_alloc_v(&vmcodep, 3);
    // save registers to variables since we're going to make calls
    gen_set_vr(&vmcodep, 0, 0);
    gen_set_vr(&vmcodep, 1, 9);
    // call fib(n-1) with param n-1 in r0 and return address in stack
    gen_sub_rvl(&vmcodep, 0, 0, 1);
    gen_set_rl(&vmcodep, 9, (long int)(char *)start + 248);
    gen_jump_l(&vmcodep, (Cell *)((char *)start + 80));
    // save fib(n-1) to a variable (v2)
    gen_set_vr(&vmcodep, 2, 0);
    // call fib(n-2) with param n-2 in r0 and return address in stack
    gen_sub_rvl(&vmcodep, 0, 0, 2);
    gen_set_rl(&vmcodep, 9, (long int)(char *)start + 344);
    gen_jump_l(&vmcodep, (Cell *)((char *)start + 80));
    // set r0 to r0=fib(n-2) + v2=fib(n-1)
    gen_add_rrv(&vmcodep, 0, 0, 2);
    // jump and deallocate spaces at the same time
    gen_jump_v_dealloc_v(&vmcodep, 1, 3);
    // base case
    // here we don't even needs to access locals since we didn't make any calls
    // registers are still the same with when we enter this function
    gen_jump_r(&vmcodep, 9);
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
