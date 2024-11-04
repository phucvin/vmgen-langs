#include "vm.h"

#define USE_spTOS 1

#ifdef USE_spTOS
#define IF_spTOS(x) x
#else
#define IF_spTOS(x)
#endif

#ifdef VM_DEBUG
#define NAME(_x)                                \
  if (vm_debug)                                 \
  {                                             \
    fprintf(vm_out, "%p: %-20s, ", ip - 1, _x); \
    fprintf(vm_out, "fp=%p, sp=%p", fp, sp);    \
  }
#else
#define NAME(_x)
#endif

/* direct threading scheme */
#define CFA_NEXT
#define NEXT_P0 ({ cfa = *ip; })
#define IP (ip)
#define SET_IP(p) ({ip=(Inst *)(p); NEXT_P0; })
#define NEXT_INST (cfa)
#define INC_IP(const_inc) ({cfa=ip[const_inc]; ip+=(const_inc); })
#define DEF_CA
#define NEXT_P1 (ip++)
#define NEXT_P2 ({ goto *(cfa.inst); })

#define NEXT ({DEF_CA NEXT_P1; NEXT_P2; })
#define IPTOS ((NEXT_INST))

#define INST_ADDR(name) (Label) && I_##name
#define LABEL(name) I_##name:

#define LABEL2(x)

#ifdef VM_PROFILING
#define SUPER_END vm_count_block(IP)
#else
#define SUPER_END
#endif

#define MAYBE_UNUSED __attribute__((unused))

/* the return type can be anything you want it to */
long engine(Cell *ip0, Cell *sp, char *fp)
{
  long long ffi_arg1 __asm__("rdi");
  long long ffi_arg2 __asm__("rsi");
  long long ffi_ret __asm__("rax");
  long long regs[10];
  long long vars[1024];
  int var_begin = 0;
  int var_end = 1;
  int var_tmp = 0;
  /* VM registers (you may want to use gcc's "Explicit Reg Vars" here) */
  Cell *ip;
  Cell cfa;
#ifdef USE_spTOS
  Cell spTOS;
#else
#define spTOS (sp[0])
#endif
  static Label labels[] = {
#include "vm-labels.i"
  };

  if (vm_debug)
    fprintf(vm_out, "entering engine(%p,%p,%p)\n", ip0, sp, fp);
  if (ip0 == NULL)
  {
    vm_prim = labels;
    return 0;
  }

  /* I don't have a clue where these things come from,
     but I've put them in macros.h for the moment */
  IF_spTOS(spTOS = sp[0]);

  SET_IP(ip0);
  SUPER_END; /* count the BB starting at ip0 */

  NEXT;
#include "vm-vm.i"
}
