#include "vm.h"

void vm_disassemble(Inst *ip, Inst *endp, Label vm_prim[])
{
  while (ip < endp)
  {
    fprintf(vm_out, "%p: ", ip);
#include "vm-disasm.i"
    {
      fprintf(vm_out, "unknown instruction %p", ip[0].inst);
      ip++;
    }
  _endif_:
    fputc('\n', vm_out);
  }
}
