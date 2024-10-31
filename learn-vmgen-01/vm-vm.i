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

LABEL(s_call0)
{
DEF_CA
Cell MAYBE_UNUSED _IP0;
Cell MAYBE_UNUSED _IP1;
Cell MAYBE_UNUSED _IP2;
NEXT_P0;
/* set_rl ( #i0 #i1 -- ) */
NAME("set_rl")
{
long i0;
long i1;
vm_Cell2i(IMM_ARG(IPTOS,305397792 ),i0);
vm_Cell2i(IMM_ARG(IP[1],305397793 ),i1);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
fputs(" i1=", vm_out); printarg_i(i1);
}
#endif
{
#line 82 "vm.vmg"
regs[i0] = i1;
#line 834 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
}
/* jump_l ( #target0 -- ) */
NAME("jump_l")
{
Inst * target0;
vm_Cell2target(IMM_ARG(IP[2],305397794 ),target0);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" target0=", vm_out); printarg_target(target0);
}
#endif
INC_IP(3);
{
#line 82 "vm.vmg"
SET_IP(target0);
#line 857 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
}
SUPER_END;
NEXT_P1;
LABEL2(s_call0)
NEXT_P2;
}

LABEL(s_call1_0)
{
DEF_CA
Cell MAYBE_UNUSED _IP0;
Cell MAYBE_UNUSED _IP1;
Cell MAYBE_UNUSED _IP2;
Cell MAYBE_UNUSED _IP3;
NEXT_P0;
/* set_rl ( #i0 #i1 -- ) */
NAME("set_rl")
{
long i0;
long i1;
vm_Cell2i(IMM_ARG(IPTOS,305397795 ),i0);
vm_Cell2i(IMM_ARG(IP[1],305397796 ),i1);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
fputs(" i1=", vm_out); printarg_i(i1);
}
#endif
{
#line 82 "vm.vmg"
regs[i0] = i1;
#line 896 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
}
/* set_rl ( #i0 #i1 -- ) */
NAME("set_rl")
{
long i0;
long i1;
vm_Cell2i(IMM_ARG(IP[2],305397797 ),i0);
vm_Cell2i(IMM_ARG(IP[3],305397798 ),i1);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
fputs(" i1=", vm_out); printarg_i(i1);
}
#endif
INC_IP(4);
{
#line 82 "vm.vmg"
regs[i0] = i1;
#line 922 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
}
NEXT_P1;
LABEL2(s_call1_0)
NEXT_P2;
}

LABEL(s_call1)
{
DEF_CA
Cell MAYBE_UNUSED _IP0;
Cell MAYBE_UNUSED _IP1;
Cell MAYBE_UNUSED _IP2;
Cell MAYBE_UNUSED _IP3;
Cell MAYBE_UNUSED _IP4;
NEXT_P0;
/* set_rl ( #i0 #i1 -- ) */
NAME("set_rl")
{
long i0;
long i1;
vm_Cell2i(IMM_ARG(IPTOS,305397799 ),i0);
vm_Cell2i(IMM_ARG(IP[1],305397800 ),i1);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
fputs(" i1=", vm_out); printarg_i(i1);
}
#endif
{
#line 82 "vm.vmg"
regs[i0] = i1;
#line 961 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
}
/* set_rl ( #i0 #i1 -- ) */
NAME("set_rl")
{
long i0;
long i1;
vm_Cell2i(IMM_ARG(IP[2],305397801 ),i0);
vm_Cell2i(IMM_ARG(IP[3],305397802 ),i1);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" i0=", vm_out); printarg_i(i0);
fputs(" i1=", vm_out); printarg_i(i1);
}
#endif
{
#line 82 "vm.vmg"
regs[i0] = i1;
#line 986 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
}
/* jump_l ( #target0 -- ) */
NAME("jump_l")
{
Inst * target0;
vm_Cell2target(IMM_ARG(IP[4],305397803 ),target0);
#ifdef VM_DEBUG
if (vm_debug) {
fputs(" target0=", vm_out); printarg_target(target0);
}
#endif
INC_IP(5);
{
#line 82 "vm.vmg"
SET_IP(target0);
#line 1009 "vm-vm.i"
}

#ifdef VM_DEBUG
if (vm_debug) {
fputs(" -- ", vm_out); fputc('\n', vm_out);
}
#endif
}
SUPER_END;
NEXT_P1;
LABEL2(s_call1)
NEXT_P2;
}

