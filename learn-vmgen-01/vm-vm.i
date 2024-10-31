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
#line 14 "vm.vmg"
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
#line 17 "vm.vmg"
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

LABEL(dup) /* dup ( i0 -- i1 i2 ) */
/*  */
NAME("dup")
{
DEF_CA
long i0;
long i1;
long i2;
NEXT_P0;
vm_Cell2i(spTOS,i0);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
}
#endif
sp += -1;
{
#line 20 "vm.vmg"
i1 = i0;
i2 = i0;
#line 92 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputs(" i1=", vm_out); printarg_i(i1);
fputs(" i2=", vm_out); printarg_i(i2);
fputc('\n', vm_out);
}
#endif
NEXT_P1;
vm_i2Cell(i1,sp[1]);
vm_i2Cell(i2,spTOS);
LABEL2(dup)
NEXT_P2;
}

LABEL(swap) /* swap ( i0 i1 -- i2 i3 ) */
/*  */
NAME("swap")
{
DEF_CA
long i0;
long i1;
long i2;
long i3;
NEXT_P0;
vm_Cell2i(sp[1],i0);
vm_Cell2i(spTOS,i1);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
fputs(" i1=", vm_out); printarg_i(i1);
}
#endif
{
#line 24 "vm.vmg"
i2 = i1;
i3 = i0;
#line 131 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputs(" i2=", vm_out); printarg_i(i2);
fputs(" i3=", vm_out); printarg_i(i3);
fputc('\n', vm_out);
}
#endif
NEXT_P1;
vm_i2Cell(i2,sp[1]);
vm_i2Cell(i3,spTOS);
LABEL2(swap)
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
#line 28 "vm.vmg"
i2 = i0 + i1;
#line 169 "vm-vm.i"
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
#line 31 "vm.vmg"
regs[i0] = regs[i1] + i2;
#line 207 "vm-vm.i"
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
#line 34 "vm.vmg"
regs[i0] = regs[i1] + regs[i2];
#line 243 "vm-vm.i"
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

LABEL(sub) /* sub ( i0 i1 -- i2 ) */
/*  */
NAME("sub")
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
#line 37 "vm.vmg"
i2 = i0 - i1;
#line 277 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputs(" i2=", vm_out); printarg_i(i2);
fputc('\n', vm_out);
}
#endif
NEXT_P1;
vm_i2Cell(i2,spTOS);
LABEL2(sub)
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
#line 40 "vm.vmg"
regs[i0] = regs[i1] - i2;
#line 315 "vm-vm.i"
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
#line 43 "vm.vmg"
regs[i0] = i1 - regs[i2];
#line 351 "vm-vm.i"
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
#line 46 "vm.vmg"
regs[i0] = regs[i1] - regs[i2];
#line 387 "vm-vm.i"
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

LABEL(push_addr) /* push_addr ( #target0 -- target1 ) */
/*  */
NAME("push_addr")
{
DEF_CA
Inst * target0;
Inst * target1;
NEXT_P0;
IF_spTOS(sp[0] = spTOS);
vm_Cell2target(IMM_ARG(IPTOS,305397777 ),target0);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" target0=", vm_out); printarg_target(target0);
}
#endif
INC_IP(1);
sp += -1;
{
#line 49 "vm.vmg"
target1 = target0;
#line 420 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputs(" target1=", vm_out); printarg_target(target1);
fputc('\n', vm_out);
}
#endif
NEXT_P1;
vm_target2Cell(target1,spTOS);
LABEL2(push_addr)
NEXT_P2;
}

LABEL(push_relative_addr) /* push_relative_addr ( #i0 -- target1 ) */
/*  */
NAME("push_relative_addr")
{
DEF_CA
long i0;
Inst * target1;
NEXT_P0;
IF_spTOS(sp[0] = spTOS);
vm_Cell2i(IMM_ARG(IPTOS,305397778 ),i0);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
}
#endif
INC_IP(1);
sp += -1;
{
#line 52 "vm.vmg"
target1 = (char*)IP + i0;
#line 455 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputs(" target1=", vm_out); printarg_target(target1);
fputc('\n', vm_out);
}
#endif
NEXT_P1;
vm_target2Cell(target1,spTOS);
LABEL2(push_relative_addr)
NEXT_P2;
}

LABEL(jump) /* jump ( target0 -- ) */
/*  */
NAME("jump")
{
DEF_CA
Inst * target0;
NEXT_P0;
vm_Cell2target(spTOS,target0);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" target0=", vm_out); printarg_target(target0);
}
#endif
sp += 1;
{
#line 55 "vm.vmg"
SET_IP(target0);
#line 487 "vm-vm.i"
}
SUPER_END;

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
IF_spTOS(spTOS = sp[0]);
LABEL2(jump)
NEXT_P2;
}

LABEL(jump_l) /* jump_l ( #target0 -- ) */
/*  */
NAME("jump_l")
{
DEF_CA
Inst * target0;
NEXT_P0;
vm_Cell2target(IMM_ARG(IPTOS,305397779 ),target0);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" target0=", vm_out); printarg_target(target0);
}
#endif
INC_IP(1);
{
#line 58 "vm.vmg"
SET_IP(target0);
#line 519 "vm-vm.i"
}
SUPER_END;

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
LABEL2(jump_l)
NEXT_P2;
}

LABEL(jump_l_if_lt) /* jump_l_if_lt ( #target0 i0 i1 -- ) */
/*  */
NAME("jump_l_if_lt")
{
DEF_CA
Inst * target0;
long i0;
long i1;
NEXT_P0;
vm_Cell2target(IMM_ARG(IPTOS,305397780 ),target0);
vm_Cell2i(sp[1],i0);
vm_Cell2i(spTOS,i1);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" target0=", vm_out); printarg_target(target0);
fputs(" i0=", vm_out); printarg_i(i0);
fputs(" i1=", vm_out); printarg_i(i1);
}
#endif
INC_IP(1);
sp += 2;
{
#line 61 "vm.vmg"
if (i0 < i1) SET_IP(target0);
#line 557 "vm-vm.i"
}
SUPER_END;

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
IF_spTOS(spTOS = sp[0]);
LABEL2(jump_l_if_lt)
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
#line 64 "vm.vmg"
return i0;
#line 589 "vm-vm.i"
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

