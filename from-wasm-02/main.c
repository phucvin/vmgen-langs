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

static char *wasm = NULL;
static long wasm_size = 0;

long consume_wasm(long at) {
  // printf("%ld 0x%x\n", at, wasm[at]);
  if (at >= wasm_size) return at;
  // TODO: Parse and generate code at the same time
  char x = wasm[at];
  if (x == 0x61) gen_halt_d(&vmcodep, 1);
  return consume_wasm(at + 1);
}

void parse_and_gen(char *filename) {
  char *source = NULL;
  long source_size = 0;
  FILE *fp = fopen(filename, "r");
  if (fp != NULL) {
    /* Go to the end of the file. */
    if (fseek(fp, 0L, SEEK_END) == 0) {
        /* Get the size of the file. */
        source_size = ftell(fp);
        if (source_size == -1) { /* Error */ }

        /* Allocate our buffer to that size. */
        source = malloc(sizeof(char) * (source_size + 1));

        /* Go back to the start of the file. */
        if (fseek(fp, 0L, SEEK_SET) != 0) { /* Error */ }

        /* Read the entire file into memory. */
        size_t newLen = fread(source, sizeof(char), source_size, fp);
        if ( ferror( fp ) != 0 ) {
            fputs("Error reading file", stderr);
        } else {
            source[newLen++] = '\0'; /* Just to be safe. */
        }
    }
    fclose(fp);
  }

  printf("file: %s\nsize: %ld bytes\n", filename, source_size);
  wasm = source;
  wasm_size = source_size;
  if (consume_wasm(0) != wasm_size) {
    printf("error: didn't finish parsing wasm");
    exit(1);
  }

  free(source); /* Don't forget to call free() later! */
}

int main(int argc, char **argv)
{
  if (argc != 2)
  {
    printf("Usage: ./vm.out <path to wasm file>\n");
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
  parse_and_gen(argv[1]);
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
