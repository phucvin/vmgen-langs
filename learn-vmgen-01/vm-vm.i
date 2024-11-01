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

LABEL(pop_r) /* pop_r ( #i0 i1 -- ) */
/*  */
NAME("pop_r")
{
DEF_CA
long i0;
long i1;
NEXT_P0;
vm_Cell2i(IMM_ARG(IPTOS,305397762 ),i0);
vm_Cell2i(spTOS,i1);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
fputs(" i1=", vm_out); printarg_i(i1);
}
#endif
INC_IP(1);
sp += 1;
{
#line 20 "vm.vmg"
regs[i0] = i1;
#line 93 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
IF_spTOS(spTOS = sp[0]);
LABEL2(pop_r)
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
#line 23 "vm.vmg"
i1 = i0;
i2 = i0;
#line 127 "vm-vm.i"
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
#line 27 "vm.vmg"
i2 = i1;
i3 = i0;
#line 166 "vm-vm.i"
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
#line 31 "vm.vmg"
i2 = i0 + i1;
#line 204 "vm-vm.i"
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
vm_Cell2i(IMM_ARG(IPTOS,305397763 ),i0);
vm_Cell2i(IMM_ARG(IP[1],305397764 ),i1);
vm_Cell2i(IMM_ARG(IP[2],305397765 ),i2);
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
regs[i0] = regs[i1] + i2;
#line 242 "vm-vm.i"
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
vm_Cell2i(IMM_ARG(IPTOS,305397766 ),i0);
vm_Cell2i(IMM_ARG(IP[1],305397767 ),i1);
vm_Cell2i(IMM_ARG(IP[2],305397768 ),i2);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
fputs(" i1=", vm_out); printarg_i(i1);
fputs(" i2=", vm_out); printarg_i(i2);
}
#endif
INC_IP(3);
{
#line 37 "vm.vmg"
regs[i0] = regs[i1] + regs[i2];
#line 278 "vm-vm.i"
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
#line 40 "vm.vmg"
i2 = i0 - i1;
#line 312 "vm-vm.i"
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
vm_Cell2i(IMM_ARG(IPTOS,305397769 ),i0);
vm_Cell2i(IMM_ARG(IP[1],305397770 ),i1);
vm_Cell2i(IMM_ARG(IP[2],305397771 ),i2);
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
regs[i0] = regs[i1] - i2;
#line 350 "vm-vm.i"
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
vm_Cell2i(IMM_ARG(IPTOS,305397772 ),i0);
vm_Cell2i(IMM_ARG(IP[1],305397773 ),i1);
vm_Cell2i(IMM_ARG(IP[2],305397774 ),i2);
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
regs[i0] = i1 - regs[i2];
#line 386 "vm-vm.i"
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
vm_Cell2i(IMM_ARG(IPTOS,305397775 ),i0);
vm_Cell2i(IMM_ARG(IP[1],305397776 ),i1);
vm_Cell2i(IMM_ARG(IP[2],305397777 ),i2);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
fputs(" i1=", vm_out); printarg_i(i1);
fputs(" i2=", vm_out); printarg_i(i2);
}
#endif
INC_IP(3);
{
#line 49 "vm.vmg"
regs[i0] = regs[i1] - regs[i2];
#line 422 "vm-vm.i"
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
vm_Cell2target(IMM_ARG(IPTOS,305397778 ),target0);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" target0=", vm_out); printarg_target(target0);
}
#endif
INC_IP(1);
sp += -1;
{
#line 52 "vm.vmg"
target1 = target0;
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
vm_Cell2i(IMM_ARG(IPTOS,305397779 ),i0);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
}
#endif
INC_IP(1);
sp += -1;
{
#line 55 "vm.vmg"
target1 = (union Cell*)((char*)IP + i0);
#line 490 "vm-vm.i"
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
#line 58 "vm.vmg"
SET_IP(target0);
#line 522 "vm-vm.i"
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
vm_Cell2target(IMM_ARG(IPTOS,305397780 ),target0);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" target0=", vm_out); printarg_target(target0);
}
#endif
INC_IP(1);
{
#line 61 "vm.vmg"
SET_IP(target0);
#line 554 "vm-vm.i"
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

LABEL(jump_r) /* jump_r ( #i0 -- ) */
/*  */
NAME("jump_r")
{
DEF_CA
long i0;
NEXT_P0;
vm_Cell2i(IMM_ARG(IPTOS,305397781 ),i0);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
}
#endif
INC_IP(1);
{
#line 64 "vm.vmg"
SET_IP(regs[i0]);
#line 585 "vm-vm.i"
}
SUPER_END;

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
LABEL2(jump_r)
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
vm_Cell2target(IMM_ARG(IPTOS,305397782 ),target0);
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
#line 67 "vm.vmg"
if (i0 < i1) SET_IP(target0);
#line 623 "vm-vm.i"
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

LABEL(jump_l_if_r_lt_l) /* jump_l_if_r_lt_l ( #target0 #i0 #i1 -- ) */
/*  */
NAME("jump_l_if_r_lt_l")
{
DEF_CA
Inst * target0;
long i0;
long i1;
NEXT_P0;
vm_Cell2target(IMM_ARG(IPTOS,305397783 ),target0);
vm_Cell2i(IMM_ARG(IP[1],305397784 ),i0);
vm_Cell2i(IMM_ARG(IP[2],305397785 ),i1);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" target0=", vm_out); printarg_target(target0);
fputs(" i0=", vm_out); printarg_i(i0);
fputs(" i1=", vm_out); printarg_i(i1);
}
#endif
INC_IP(3);
{
#line 70 "vm.vmg"
if (regs[i0] < i1) SET_IP(target0);
#line 661 "vm-vm.i"
}
SUPER_END;

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
LABEL2(jump_l_if_r_lt_l)
NEXT_P2;
}

LABEL(jump_if_r_lt_l) /* jump_if_r_lt_l ( target0 #i0 #i1 -- ) */
/*  */
NAME("jump_if_r_lt_l")
{
DEF_CA
Inst * target0;
long i0;
long i1;
NEXT_P0;
vm_Cell2target(spTOS,target0);
vm_Cell2i(IMM_ARG(IPTOS,305397786 ),i0);
vm_Cell2i(IMM_ARG(IP[1],305397787 ),i1);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" target0=", vm_out); printarg_target(target0);
fputs(" i0=", vm_out); printarg_i(i0);
fputs(" i1=", vm_out); printarg_i(i1);
}
#endif
INC_IP(2);
sp += 1;
{
#line 73 "vm.vmg"
if (regs[i0] < i1) SET_IP(target0);
#line 699 "vm-vm.i"
}
SUPER_END;

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
IF_spTOS(spTOS = sp[0]);
LABEL2(jump_if_r_lt_l)
NEXT_P2;
}

LABEL(set_rl) /* set_rl ( #i0 #i1 -- ) */
/*  */
NAME("set_rl")
{
DEF_CA
long i0;
long i1;
NEXT_P0;
vm_Cell2i(IMM_ARG(IPTOS,305397788 ),i0);
vm_Cell2i(IMM_ARG(IP[1],305397789 ),i1);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
fputs(" i1=", vm_out); printarg_i(i1);
}
#endif
INC_IP(2);
{
#line 76 "vm.vmg"
regs[i0] = i1;
#line 734 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
LABEL2(set_rl)
NEXT_P2;
}

LABEL(set_rr) /* set_rr ( #i0 #i1 -- ) */
/*  */
NAME("set_rr")
{
DEF_CA
long i0;
long i1;
NEXT_P0;
vm_Cell2i(IMM_ARG(IPTOS,305397790 ),i0);
vm_Cell2i(IMM_ARG(IP[1],305397791 ),i1);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
fputs(" i1=", vm_out); printarg_i(i1);
}
#endif
INC_IP(2);
{
#line 79 "vm.vmg"
regs[i0] = regs[i1];
#line 767 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
LABEL2(set_rr)
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
#line 82 "vm.vmg"
return i0;
#line 797 "vm-vm.i"
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

LABEL(end_r) /* end_r ( #i0 -- ) */
/*  */
NAME("end_r")
{
DEF_CA
long i0;
NEXT_P0;
vm_Cell2i(IMM_ARG(IPTOS,305397792 ),i0);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
}
#endif
INC_IP(1);
{
#line 85 "vm.vmg"
return regs[i0];
#line 828 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
LABEL2(end_r)
NEXT_P2;
}

LABEL(set_r0l) /* set_r0l ( #i0 -- ) */
/*  */
NAME("set_r0l")
{
DEF_CA
long i0;
NEXT_P0;
vm_Cell2i(IMM_ARG(IPTOS,305397793 ),i0);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
}
#endif
INC_IP(1);
{
#line 90 "vm.vmg"
reg0 = i0;
#line 858 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
LABEL2(set_r0l)
NEXT_P2;
}

LABEL(set_r1l) /* set_r1l ( #i0 -- ) */
/*  */
NAME("set_r1l")
{
DEF_CA
long i0;
NEXT_P0;
vm_Cell2i(IMM_ARG(IPTOS,305397794 ),i0);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
}
#endif
INC_IP(1);
{
#line 93 "vm.vmg"
reg1 = i0;
#line 888 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
LABEL2(set_r1l)
NEXT_P2;
}

LABEL(push_r0) /* push_r0 ( -- i0 ) */
/*  */
NAME("push_r0")
{
DEF_CA
long i0;
NEXT_P0;
IF_spTOS(sp[0] = spTOS);
#ifdef VM_DEBUG
if (vm_debug) {
}
#endif
sp += -1;
{
#line 96 "vm.vmg"
i0 = reg0;
#line 917 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputs(" i0=", vm_out); printarg_i(i0);
fputc('\n', vm_out);
}
#endif
NEXT_P1;
vm_i2Cell(i0,spTOS);
LABEL2(push_r0)
NEXT_P2;
}

LABEL(push_r1) /* push_r1 ( -- i0 ) */
/*  */
NAME("push_r1")
{
DEF_CA
long i0;
NEXT_P0;
IF_spTOS(sp[0] = spTOS);
#ifdef VM_DEBUG
if (vm_debug) {
}
#endif
sp += -1;
{
#line 99 "vm.vmg"
i0 = reg1;
#line 948 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputs(" i0=", vm_out); printarg_i(i0);
fputc('\n', vm_out);
}
#endif
NEXT_P1;
vm_i2Cell(i0,spTOS);
LABEL2(push_r1)
NEXT_P2;
}

LABEL(pop_r1) /* pop_r1 ( i0 -- ) */
/*  */
NAME("pop_r1")
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
#line 102 "vm.vmg"
reg1 = i0;
#line 980 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
IF_spTOS(spTOS = sp[0]);
LABEL2(pop_r1)
NEXT_P2;
}

LABEL(add_r0r0r0) /* add_r0r0r0 ( -- ) */
/*  */
NAME("add_r0r0r0")
{
DEF_CA
NEXT_P0;
#ifdef VM_DEBUG
if (vm_debug) {
}
#endif
{
#line 105 "vm.vmg"
reg0 = reg0 + reg0;
#line 1007 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
LABEL2(add_r0r0r0)
NEXT_P2;
}

LABEL(add_r0r0r1) /* add_r0r0r1 ( -- ) */
/*  */
NAME("add_r0r0r1")
{
DEF_CA
NEXT_P0;
#ifdef VM_DEBUG
if (vm_debug) {
}
#endif
{
#line 108 "vm.vmg"
reg0 = reg0 + reg1;
#line 1033 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
LABEL2(add_r0r0r1)
NEXT_P2;
}

LABEL(sub_r0r0l) /* sub_r0r0l ( #i0 -- ) */
/*  */
NAME("sub_r0r0l")
{
DEF_CA
long i0;
NEXT_P0;
vm_Cell2i(IMM_ARG(IPTOS,305397795 ),i0);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
}
#endif
INC_IP(1);
{
#line 111 "vm.vmg"
reg0 = reg0 - i0;
#line 1063 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
LABEL2(sub_r0r0l)
NEXT_P2;
}

LABEL(sub_r0r1l) /* sub_r0r1l ( #i0 -- ) */
/*  */
NAME("sub_r0r1l")
{
DEF_CA
long i0;
NEXT_P0;
vm_Cell2i(IMM_ARG(IPTOS,305397796 ),i0);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
}
#endif
INC_IP(1);
{
#line 114 "vm.vmg"
reg0 = reg1 - i0;
#line 1093 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
LABEL2(sub_r0r1l)
NEXT_P2;
}

LABEL(jump_r1) /* jump_r1 ( -- ) */
/*  */
NAME("jump_r1")
{
DEF_CA
NEXT_P0;
#ifdef VM_DEBUG
if (vm_debug) {
}
#endif
{
#line 117 "vm.vmg"
SET_IP(reg1);
#line 1119 "vm-vm.i"
}
SUPER_END;

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
LABEL2(jump_r1)
NEXT_P2;
}

LABEL(jump_l_if_r0_lt_l) /* jump_l_if_r0_lt_l ( #target0 #i0 -- ) */
/*  */
NAME("jump_l_if_r0_lt_l")
{
DEF_CA
Inst * target0;
long i0;
NEXT_P0;
vm_Cell2target(IMM_ARG(IPTOS,305397797 ),target0);
vm_Cell2i(IMM_ARG(IP[1],305397798 ),i0);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" target0=", vm_out); printarg_target(target0);
fputs(" i0=", vm_out); printarg_i(i0);
}
#endif
INC_IP(2);
{
#line 120 "vm.vmg"
if (reg0 < i0) SET_IP(target0);
#line 1153 "vm-vm.i"
}
SUPER_END;

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
LABEL2(jump_l_if_r0_lt_l)
NEXT_P2;
}

LABEL(alloc_v) /* alloc_v ( #i0 -- ) */
/*  */
NAME("alloc_v")
{
DEF_CA
long i0;
NEXT_P0;
vm_Cell2i(IMM_ARG(IPTOS,305397799 ),i0);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
}
#endif
INC_IP(1);
{
#line 125 "vm.vmg"
var_begin = var_end;
var_end += i0;
// printf("\n\t\talloc_v begin=%d end=%d\n", var_begin, var_end);
#line 1186 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
LABEL2(alloc_v)
NEXT_P2;
}

LABEL(set_vr) /* set_vr ( #i0 #i1 -- ) */
/*  */
NAME("set_vr")
{
DEF_CA
long i0;
long i1;
NEXT_P0;
vm_Cell2i(IMM_ARG(IPTOS,305397800 ),i0);
vm_Cell2i(IMM_ARG(IP[1],305397801 ),i1);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
fputs(" i1=", vm_out); printarg_i(i1);
}
#endif
INC_IP(2);
{
#line 130 "vm.vmg"
vars[var_begin + i0] = regs[i1];
#line 1219 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
LABEL2(set_vr)
NEXT_P2;
}

LABEL(sub_rvl) /* sub_rvl ( #i0 #i1 #i2 -- ) */
/*  */
NAME("sub_rvl")
{
DEF_CA
long i0;
long i1;
long i2;
NEXT_P0;
vm_Cell2i(IMM_ARG(IPTOS,305397802 ),i0);
vm_Cell2i(IMM_ARG(IP[1],305397803 ),i1);
vm_Cell2i(IMM_ARG(IP[2],305397804 ),i2);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
fputs(" i1=", vm_out); printarg_i(i1);
fputs(" i2=", vm_out); printarg_i(i2);
}
#endif
INC_IP(3);
{
#line 133 "vm.vmg"
regs[i0] = vars[var_begin + i1] - i2;
#line 1255 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
LABEL2(sub_rvl)
NEXT_P2;
}

LABEL(add_rrv) /* add_rrv ( #i0 #i1 #i2 -- ) */
/*  */
NAME("add_rrv")
{
DEF_CA
long i0;
long i1;
long i2;
NEXT_P0;
vm_Cell2i(IMM_ARG(IPTOS,305397805 ),i0);
vm_Cell2i(IMM_ARG(IP[1],305397806 ),i1);
vm_Cell2i(IMM_ARG(IP[2],305397807 ),i2);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
fputs(" i1=", vm_out); printarg_i(i1);
fputs(" i2=", vm_out); printarg_i(i2);
}
#endif
INC_IP(3);
{
#line 136 "vm.vmg"
regs[i0] = regs[i1] + vars[var_begin + i2];
#line 1291 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
LABEL2(add_rrv)
NEXT_P2;
}

LABEL(jump_v_dealloc_v) /* jump_v_dealloc_v ( #i0 #i1 -- ) */
/*  */
NAME("jump_v_dealloc_v")
{
DEF_CA
long i0;
long i1;
NEXT_P0;
vm_Cell2i(IMM_ARG(IPTOS,305397808 ),i0);
vm_Cell2i(IMM_ARG(IP[1],305397809 ),i1);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
fputs(" i1=", vm_out); printarg_i(i1);
}
#endif
INC_IP(2);
{
#line 139 "vm.vmg"
SET_IP(vars[var_begin + i0]);
// printf("\n\t\tdealloc_v begin=%d end=%d\n", var_begin, var_end);
var_tmp = var_begin;
var_begin = var_end - i1;
var_end = var_tmp;
// printf("\n\t\tdealloc_v begin=%d end=%d\n", var_begin, var_end);
#line 1329 "vm-vm.i"
}
SUPER_END;

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
NEXT_P1;
LABEL2(jump_v_dealloc_v)
NEXT_P2;
}

LABEL(s_pljl)
{
DEF_CA
Cell MAYBE_UNUSED _IP0;
Cell MAYBE_UNUSED _IP1;
Cell MAYBE_UNUSED _sp0;
NEXT_P0;
IF_spTOS(sp[0] = spTOS);
/* push_l ( #i0 -- i1 ) */
NAME("push_l")
{
long i0;
long i1;
vm_Cell2i(IMM_ARG(IPTOS,305397810 ),i0);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
}
#endif
sp += -1;
{
#line 139 "vm.vmg"
i1 = i0;
#line 1366 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputs(" i1=", vm_out); printarg_i(i1);
fputc('\n', vm_out);
}
#endif
vm_i2Cell(i1,spTOS);
}
/* jump_l ( #target0 -- ) */
NAME("jump_l")
{
Inst * target0;
vm_Cell2target(IMM_ARG(IP[1],305397811 ),target0);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" target0=", vm_out); printarg_target(target0);
}
#endif
INC_IP(2);
{
#line 139 "vm.vmg"
SET_IP(target0);
#line 1391 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
}
SUPER_END;
NEXT_P1;
LABEL2(s_pljl)
NEXT_P2;
}

