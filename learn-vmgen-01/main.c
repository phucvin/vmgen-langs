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
  vm_target2Cell(target, *((Cell *) *vmcodepp));
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
	engine_t runvm = engine_debug;
  vm_debug = 1;

  vmcodep = vm_code;
	vm_out = stderr;
	(void)runvm(NULL, NULL, NULL); /* initialize vm_prim */
	init_peeptable();

	start = vmcodep;
	// Generate bytecode directly here for now
	{
    gen_set_rl(&vmcodep, 0 , 9);
    gen_push_r(&vmcodep, 0);
    gen_end(&vmcodep);
  }
	vmcode_end = vmcodep;

	printf("\nvm assembly:\n");
	vm_disassemble(vm_code, vmcodep, vm_prim);

	printf("\nvm run:\n");
	printf("\nreturn code: %ld\n", runvm(start, stack + STACK_SIZE - 1, NULL));

	// printf("\nvm profile:\n");
	// vm_print_profile(vm_out);

	return 0;
}
