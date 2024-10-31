#include <stdlib.h>
#include "vm.h"

/* the numbers in this struct are primitive indices */
typedef struct Combination
{
  int prefix;
  int lastprim;
  int combination_prim;
} Combination;

Combination peephole_table[] = {
#include "vm-peephole.i"
};

int use_super = 1; /* turned off by option -p */

typedef struct Peeptable_entry
{
  struct Peeptable_entry *next;
  Label prefix;
  Label lastprim;
  Label combination_prim;
} Peeptable_entry;

#define HASH_SIZE 1024
#define hash(_i1, _i2) (((((long)(_i1)) ^ ((long)(_i2))) >> 4) & (HASH_SIZE - 1))

struct Peeptable_entry **peeptable;

Peeptable_entry **prepare_peephole_table(Label insts[])
{
  long i;
  Peeptable_entry **pt = (Peeptable_entry **)calloc(HASH_SIZE, sizeof(Peeptable_entry *));

  for (i = 0; i < sizeof(peephole_table) / sizeof(peephole_table[0]); i++)
  {
    Combination *c = &peephole_table[i];
    Peeptable_entry *p = (Peeptable_entry *)malloc(sizeof(Peeptable_entry));
    long h;
    p->prefix = insts[c->prefix];
    p->lastprim = insts[c->lastprim];
    p->combination_prim = insts[c->combination_prim];
    h = hash((p->prefix), (p->lastprim));
    p->next = pt[h];
    pt[h] = p;
  }
  return pt;
}

void init_peeptable(void)
{
  peeptable = prepare_peephole_table(vm_prim);
}

Label peephole_opt(Label inst1, Label inst2, Peeptable_entry **peeptable)
{
  Peeptable_entry **pt = (Peeptable_entry **)peeptable;
  Peeptable_entry *p;

  if (use_super == 0)
    return NULL;
  for (p = pt[hash(inst1, inst2)]; p != NULL; p = p->next)
    if (inst1 == p->prefix && inst2 == p->lastprim)
      return p->combination_prim;
  return NULL;
}

Inst *last_compiled = NULL;

void gen_inst(Inst **vmcodepp, Label i)
{
  if (last_compiled != NULL)
  {
    Label combo = peephole_opt((*last_compiled).inst, i, peeptable);
    if (combo != NULL)
    {
      (*last_compiled).inst = combo;
      return;
    }
  }
  last_compiled = *vmcodepp;
  (**vmcodepp).inst = i;
  (*vmcodepp)++;
}
