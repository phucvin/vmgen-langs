LABEL(push) /* push ( #i0 -- i1 ) */
/*  */
NAME("push")
{
DEF_CA
long i0;
long i1;
NEXT_P0;
IF_spTOS(sp[0] = spTOS);
vm_Cell2i(IMM_ARG(IPTOS,305397760 ),i0);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
}
#endif
INC_IP(1);
sp += -1;
{
#line 13 "vm.vmg"
i1 = i0;
#line 22 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputs(" i1=", vm_out); printarg_i(i1);
fputc('\n', vm_out);
}
#endif
NEXT_P1;
vm_i2Cell(i1,spTOS);
LABEL2(push)
NEXT_P2;
}

LABEL(end) /* end ( i0 -- ) */
/*  */
NAME("end")
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
#line 16 "vm.vmg"
return i0;
#line 54 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
IF_spTOS(spTOS = sp[0]);
LABEL2(end)
NEXT_P2;
}

