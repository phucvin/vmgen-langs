LABEL(push_l) /* push_l ( #i0 -- i1 ) */
/*  */
NAME("push_l")
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
LABEL2(push_l)
NEXT_P2;
}

LABEL(push_r) /* push_r ( #i0 -- i1 ) */
/*  */
NAME("push_r")
{
DEF_CA
long i0;
long i1;
NEXT_P0;
IF_spTOS(sp[0] = spTOS);
vm_Cell2i(IMM_ARG(IPTOS,305397761 ),i0);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
}
#endif
INC_IP(1);
sp += -1;
{
#line 16 "vm.vmg"
i1 = regs[i0];
#line 57 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputs(" i1=", vm_out); printarg_i(i1);
fputc('\n', vm_out);
}
#endif
NEXT_P1;
vm_i2Cell(i1,spTOS);
LABEL2(push_r)
NEXT_P2;
}

LABEL(add) /* add ( i0 i1 -- i2 ) */
/*  */
NAME("add")
{
DEF_CA
long i0;
long i1;
long i2;
NEXT_P0;
vm_Cell2i(sp[1],i0);
vm_Cell2i(spTOS,i1);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
fputs(" i1=", vm_out); printarg_i(i1);
}
#endif
sp += 1;
{
#line 19 "vm.vmg"
i2 = i0 + i1;
#line 93 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputs(" i2=", vm_out); printarg_i(i2);
fputc('\n', vm_out);
}
#endif
NEXT_P1;
vm_i2Cell(i2,spTOS);
LABEL2(add)
NEXT_P2;
}

LABEL(add_rrl) /* add_rrl ( #i0 #i1 #i2 -- ) */
/*  */
NAME("add_rrl")
{
DEF_CA
long i0;
long i1;
long i2;
NEXT_P0;
vm_Cell2i(IMM_ARG(IPTOS,305397762 ),i0);
vm_Cell2i(IMM_ARG(IP[1],305397763 ),i1);
vm_Cell2i(IMM_ARG(IP[2],305397764 ),i2);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
fputs(" i1=", vm_out); printarg_i(i1);
fputs(" i2=", vm_out); printarg_i(i2);
}
#endif
INC_IP(3);
{
#line 22 "vm.vmg"
regs[i0] = regs[i1] + i2;
#line 131 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
LABEL2(add_rrl)
NEXT_P2;
}

LABEL(add_rrr) /* add_rrr ( #i0 #i1 #i2 -- ) */
/*  */
NAME("add_rrr")
{
DEF_CA
long i0;
long i1;
long i2;
NEXT_P0;
vm_Cell2i(IMM_ARG(IPTOS,305397765 ),i0);
vm_Cell2i(IMM_ARG(IP[1],305397766 ),i1);
vm_Cell2i(IMM_ARG(IP[2],305397767 ),i2);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
fputs(" i1=", vm_out); printarg_i(i1);
fputs(" i2=", vm_out); printarg_i(i2);
}
#endif
INC_IP(3);
{
#line 25 "vm.vmg"
regs[i0] = regs[i1] + regs[i2];
#line 167 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
LABEL2(add_rrr)
NEXT_P2;
}

LABEL(sub_rrl) /* sub_rrl ( #i0 #i1 #i2 -- ) */
/*  */
NAME("sub_rrl")
{
DEF_CA
long i0;
long i1;
long i2;
NEXT_P0;
vm_Cell2i(IMM_ARG(IPTOS,305397768 ),i0);
vm_Cell2i(IMM_ARG(IP[1],305397769 ),i1);
vm_Cell2i(IMM_ARG(IP[2],305397770 ),i2);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
fputs(" i1=", vm_out); printarg_i(i1);
fputs(" i2=", vm_out); printarg_i(i2);
}
#endif
INC_IP(3);
{
#line 28 "vm.vmg"
regs[i0] = regs[i1] - i2;
#line 203 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
LABEL2(sub_rrl)
NEXT_P2;
}

LABEL(sub_rlr) /* sub_rlr ( #i0 #i1 #i2 -- ) */
/*  */
NAME("sub_rlr")
{
DEF_CA
long i0;
long i1;
long i2;
NEXT_P0;
vm_Cell2i(IMM_ARG(IPTOS,305397771 ),i0);
vm_Cell2i(IMM_ARG(IP[1],305397772 ),i1);
vm_Cell2i(IMM_ARG(IP[2],305397773 ),i2);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
fputs(" i1=", vm_out); printarg_i(i1);
fputs(" i2=", vm_out); printarg_i(i2);
}
#endif
INC_IP(3);
{
#line 31 "vm.vmg"
regs[i0] = i1 - regs[i2];
#line 239 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
LABEL2(sub_rlr)
NEXT_P2;
}

LABEL(sub_rrr) /* sub_rrr ( #i0 #i1 #i2 -- ) */
/*  */
NAME("sub_rrr")
{
DEF_CA
long i0;
long i1;
long i2;
NEXT_P0;
vm_Cell2i(IMM_ARG(IPTOS,305397774 ),i0);
vm_Cell2i(IMM_ARG(IP[1],305397775 ),i1);
vm_Cell2i(IMM_ARG(IP[2],305397776 ),i2);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
fputs(" i1=", vm_out); printarg_i(i1);
fputs(" i2=", vm_out); printarg_i(i2);
}
#endif
INC_IP(3);
{
#line 34 "vm.vmg"
regs[i0] = regs[i1] - regs[i2];
#line 275 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
LABEL2(sub_rrr)
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
#line 37 "vm.vmg"
return i0;
#line 305 "vm-vm.i"
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

