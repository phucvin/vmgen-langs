#include <stdio.h>

#ifdef __GNUC__
typedef void *Label; 
#else
typedef long Label;
#endif

typedef union Cell {
  long i;
  union Cell *target;
  Label inst;
  char *a;
} Cell, Inst;

#define vm_Cell2i(_cell,_x)	((_x)=(_cell).i)
#define vm_i2Cell(_x,_cell)	((_cell).i=(_x))	
#define vm_Cell2target(_cell,_x) ((_x)=(_cell).target)
#define vm_target2Cell(_x,_cell) ((_cell).target=(_x))	
#define vm_Cell2a(_cell,_x)	((_x)=(_cell).a)
#define vm_a2Cell(_x,_cell)	((_cell).a=(_x))	
#define vm_Cell2Cell(_x,_y) ((_y)=(_x))

/* for future extensions */
#define IMM_ARG(access,value)		(access)

#define VM_IS_INST(_inst, n) ((_inst).inst == vm_prim[n])

extern Label *vm_prim;
extern int locals;
extern struct Peeptable_entry **peeptable;
extern int vm_debug;
extern FILE *yyin;
extern int yylineno;
extern char *program_name;
extern FILE *vm_out;
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

/* mini type-specific support functions */
void genarg_i(Inst **vmcodepp, long i);
void printarg_i(long i);
void genarg_target(Inst **vmcodepp, Inst *target);
void printarg_target(Inst *target);
void printarg_a(char *a);
void printarg_Cell(Cell i);

/* engine functions (type not fixed) */
long engine(Inst *ip0, Cell *sp, char *fp);
long engine_debug(Inst *ip0, Cell *sp, char *fp);

/* other generic functions */
int yyparse(void);

/* mini-specific functions */
void insert_func(char *name, Inst *start, int locals, int nonparams);
Inst *func_addr(char *name);
long func_calladjust(char *name);
void insert_local(char *name);
long var_offset(char *name);
void gen_main_end(void);

/* stack pointer change for a function with n nonparams */
#define adjust(n)  ((n) * -sizeof(Cell))
