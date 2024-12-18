#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include "vm.h"

/* data structure: simple hash table with external chaining */

#define HASH_SIZE (1 << 20)
#define hash(p) ((((long)(p)) / sizeof(Inst)) & (HASH_SIZE - 1))

typedef long long long_long;

typedef struct block_count
{
  struct block_count *next;        /* next in hash table */
  struct block_count *fallthrough; /* the block that this one falls
                                       through to without SUPER_END */
  Inst *ip;
  long_long count;
  char **insts;
  size_t ninsts;
} block_count;

block_count *blocks[HASH_SIZE];
Inst *vmcode_end;

block_count *block_lookup(Inst *ip)
{
  block_count *b = blocks[hash(ip)];

  while (b != NULL && b->ip != ip)
    b = b->next;
  return b;
}

/* looks up present elements, inserts absent elements */
block_count *block_insert(Inst *ip)
{
  block_count *b = block_lookup(ip);
  block_count *new;

  if (b != NULL)
    return b;
  new = (block_count *)malloc(sizeof(block_count));
  new->next = blocks[hash(ip)];
  new->fallthrough = NULL;
  new->ip = ip;
  new->count = (long_long)0;
  new->insts = malloc(1);
  assert(new->insts != NULL);
  new->ninsts = 0;
  blocks[hash(ip)] = new;
  return new;
}

void add_inst(block_count *b, char *inst)
{
  b->insts = realloc(b->insts, (b->ninsts + 1) * sizeof(char *));
  b->insts[b->ninsts++] = inst;
}

void vm_count_block(Inst *ip)
{
  block_insert(ip)->count++;
}

void postprocess_block(block_count *b)
{
  Inst *ip = b->ip;
  block_count *next_block = NULL;

  while (next_block == NULL && ip < vmcode_end)
  {
#include "vm-profile.i"
    /* else */
    {
      add_inst(b, "unknown");
      ip++;
    }
  _endif_:
    next_block = block_lookup(ip);
  }
  /* we fell through, so set fallthrough and update the count */
  b->fallthrough = next_block;
  /* also update the counts of all following fallthrough blocks that
     have already been processed */
  while (next_block != NULL)
  {
    next_block->count += b->count;
    next_block = next_block->fallthrough;
  }
}

/* Deal with block entry by falling through from non-SUPER_END
   instructions.  And fill the insts and ninsts fields. */
void postprocess(void)
{
  size_t i;

  for (i = 0; i < HASH_SIZE; i++)
  {
    block_count *b = blocks[i];
    for (; b != 0; b = b->next)
      postprocess_block(b);
  }
}

void print_block(FILE *file, block_count *b)
{
  size_t i, j, k;

  for (i = 2; i < 12; i++)
    for (j = 0; i + j <= b->ninsts; j++)
    {
      fprintf(file, "%14lld\t", b->count);
      for (k = j; k < i + j; k++)
        fprintf(file, "%s ", b->insts[k]);
      putc('\n', file);
    }
}

void vm_print_profile(FILE *file)
{
  size_t i;

  postprocess();
  for (i = 0; i < HASH_SIZE; i++)
  {
    block_count *b = blocks[i];
    for (; b != 0; b = b->next)
      print_block(file, b);
  }
}
