#include <stdio.h>

typedef void *Label;

typedef union Cell
{
  Label inst;
  long long i;
  union Cell *target;
} Cell, Inst;

#define vm_Cell2i(_cell, _x) ((_x) = (_cell).i)
#define vm_i2Cell(_x, _cell) ((_cell).i = (_x))
#define vm_Cell2target(_cell,_x) ((_x)=(_cell).target)
#define vm_target2Cell(_x,_cell) ((_cell).target=(_x))
#define vm_Cell2Cell(_x, _y) ((_y) = (_x))

#define VM_IS_INST(_inst, n) ((_inst).inst == vm_prim[n])

#define IMM_ARG(access, value) (access)

extern Label *vm_prim;
extern struct Peeptable_entry **peeptable;
extern int vm_debug;
extern FILE *vm_out;
extern Inst *vmcodestart;
extern Inst *vmcodep;
extern Inst *last_compiled;
extern Inst *vmcode_end;
extern int use_super;

/* generic vmgen support functions (e.g., wrappers) */
void gen_inst(Inst **vmcodepp, Label i);
void init_peeptable(void);
void vm_disassemble(Inst *ip, Inst *endp, Label prim[]);
void vm_count_block(Inst *ip);
struct block_count *block_insert(Inst *ip);
void vm_print_profile(FILE *file);

/* vm type-specific support functions */
void genarg_i(Inst **vmcodepp, long long i);
void printarg_i(long long i);
void genarg_target(Inst **vmcodepp, Inst *target);
void printarg_target(Inst *target);
void printarg_Cell(Cell i);

/* engine functions (type not fixed) */
long engine(Inst *ip0, Cell *sp, char *fp);
long engine_debug(Inst *ip0, Cell *sp, char *fp);

extern FILE *yyin;
int yyparse(void);

void insert_jump(const char *name, Inst *inst);
void insert_label(const char *name, Inst *inst);
long long get_ffi_addr(const char *name);