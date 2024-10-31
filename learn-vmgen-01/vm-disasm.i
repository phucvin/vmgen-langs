if (VM_IS_INST(*ip, 0)) {
  fputs("push", vm_out);
{
long i0;
vm_Cell2i(IMM_ARG(IPTOS,305397760 ),i0);
fputs(" i0=", vm_out); printarg_i(i0);
}
  ip += 2;
  goto _endif_;
}
if (VM_IS_INST(*ip, 1)) {
  fputs("end", vm_out);
  ip += 1;
  goto _endif_;
}
