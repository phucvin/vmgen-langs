LABEL(push) /* push ( i0 -- ) */
/*  */
NAME("push")
{
DEF_CA
long i0;
NEXT_P0;
vm_Cell2i(spTOS,i0);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
}
#endif
sp += 1;
{
#line 10 "vm.vmg"
// TODO
#line 19 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
IF_spTOS(spTOS = sp[0]);
LABEL2(push)
NEXT_P2;
}

