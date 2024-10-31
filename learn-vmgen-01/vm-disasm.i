if (VM_IS_INST(*ip, 0)) {
  fputs("push_l", vm_out);
{
long i0;
vm_Cell2i(IMM_ARG(IPTOS,305397760 ),i0);
fputs(" i0=", vm_out); printarg_i(i0);
}
  ip += 2;
  goto _endif_;
}
if (VM_IS_INST(*ip, 1)) {
  fputs("push_r", vm_out);
{
long i0;
vm_Cell2i(IMM_ARG(IPTOS,305397761 ),i0);
fputs(" i0=", vm_out); printarg_i(i0);
}
  ip += 2;
  goto _endif_;
}
if (VM_IS_INST(*ip, 2)) {
  fputs("pop_r", vm_out);
{
long i0;
vm_Cell2i(IMM_ARG(IPTOS,305397762 ),i0);
fputs(" i0=", vm_out); printarg_i(i0);
}
  ip += 2;
  goto _endif_;
}
if (VM_IS_INST(*ip, 3)) {
  fputs("dup", vm_out);
  ip += 1;
  goto _endif_;
}
if (VM_IS_INST(*ip, 4)) {
  fputs("swap", vm_out);
  ip += 1;
  goto _endif_;
}
if (VM_IS_INST(*ip, 5)) {
  fputs("add", vm_out);
  ip += 1;
  goto _endif_;
}
if (VM_IS_INST(*ip, 6)) {
  fputs("add_rrl", vm_out);
{
long i0;
vm_Cell2i(IMM_ARG(IPTOS,305397763 ),i0);
fputs(" i0=", vm_out); printarg_i(i0);
}
{
long i1;
vm_Cell2i(IMM_ARG(IP[1],305397764 ),i1);
fputs(" i1=", vm_out); printarg_i(i1);
}
{
long i2;
vm_Cell2i(IMM_ARG(IP[2],305397765 ),i2);
fputs(" i2=", vm_out); printarg_i(i2);
}
  ip += 4;
  goto _endif_;
}
if (VM_IS_INST(*ip, 7)) {
  fputs("add_rrr", vm_out);
{
long i0;
vm_Cell2i(IMM_ARG(IPTOS,305397766 ),i0);
fputs(" i0=", vm_out); printarg_i(i0);
}
{
long i1;
vm_Cell2i(IMM_ARG(IP[1],305397767 ),i1);
fputs(" i1=", vm_out); printarg_i(i1);
}
{
long i2;
vm_Cell2i(IMM_ARG(IP[2],305397768 ),i2);
fputs(" i2=", vm_out); printarg_i(i2);
}
  ip += 4;
  goto _endif_;
}
if (VM_IS_INST(*ip, 8)) {
  fputs("sub", vm_out);
  ip += 1;
  goto _endif_;
}
if (VM_IS_INST(*ip, 9)) {
  fputs("sub_rrl", vm_out);
{
long i0;
vm_Cell2i(IMM_ARG(IPTOS,305397769 ),i0);
fputs(" i0=", vm_out); printarg_i(i0);
}
{
long i1;
vm_Cell2i(IMM_ARG(IP[1],305397770 ),i1);
fputs(" i1=", vm_out); printarg_i(i1);
}
{
long i2;
vm_Cell2i(IMM_ARG(IP[2],305397771 ),i2);
fputs(" i2=", vm_out); printarg_i(i2);
}
  ip += 4;
  goto _endif_;
}
if (VM_IS_INST(*ip, 10)) {
  fputs("sub_rlr", vm_out);
{
long i0;
vm_Cell2i(IMM_ARG(IPTOS,305397772 ),i0);
fputs(" i0=", vm_out); printarg_i(i0);
}
{
long i1;
vm_Cell2i(IMM_ARG(IP[1],305397773 ),i1);
fputs(" i1=", vm_out); printarg_i(i1);
}
{
long i2;
vm_Cell2i(IMM_ARG(IP[2],305397774 ),i2);
fputs(" i2=", vm_out); printarg_i(i2);
}
  ip += 4;
  goto _endif_;
}
if (VM_IS_INST(*ip, 11)) {
  fputs("sub_rrr", vm_out);
{
long i0;
vm_Cell2i(IMM_ARG(IPTOS,305397775 ),i0);
fputs(" i0=", vm_out); printarg_i(i0);
}
{
long i1;
vm_Cell2i(IMM_ARG(IP[1],305397776 ),i1);
fputs(" i1=", vm_out); printarg_i(i1);
}
{
long i2;
vm_Cell2i(IMM_ARG(IP[2],305397777 ),i2);
fputs(" i2=", vm_out); printarg_i(i2);
}
  ip += 4;
  goto _endif_;
}
if (VM_IS_INST(*ip, 12)) {
  fputs("push_addr", vm_out);
{
Inst * target0;
vm_Cell2target(IMM_ARG(IPTOS,305397778 ),target0);
fputs(" target0=", vm_out); printarg_target(target0);
}
  ip += 2;
  goto _endif_;
}
if (VM_IS_INST(*ip, 13)) {
  fputs("push_relative_addr", vm_out);
{
long i0;
vm_Cell2i(IMM_ARG(IPTOS,305397779 ),i0);
fputs(" i0=", vm_out); printarg_i(i0);
}
  ip += 2;
  goto _endif_;
}
if (VM_IS_INST(*ip, 14)) {
  fputs("jump", vm_out);
  ip += 1;
  goto _endif_;
}
if (VM_IS_INST(*ip, 15)) {
  fputs("jump_l", vm_out);
{
Inst * target0;
vm_Cell2target(IMM_ARG(IPTOS,305397780 ),target0);
fputs(" target0=", vm_out); printarg_target(target0);
}
  ip += 2;
  goto _endif_;
}
if (VM_IS_INST(*ip, 16)) {
  fputs("jump_l_if_lt", vm_out);
{
Inst * target0;
vm_Cell2target(IMM_ARG(IPTOS,305397781 ),target0);
fputs(" target0=", vm_out); printarg_target(target0);
}
  ip += 2;
  goto _endif_;
}
if (VM_IS_INST(*ip, 17)) {
  fputs("jump_l_if_r_lt_l", vm_out);
{
Inst * target0;
vm_Cell2target(IMM_ARG(IPTOS,305397782 ),target0);
fputs(" target0=", vm_out); printarg_target(target0);
}
{
long i0;
vm_Cell2i(IMM_ARG(IP[1],305397783 ),i0);
fputs(" i0=", vm_out); printarg_i(i0);
}
{
long i1;
vm_Cell2i(IMM_ARG(IP[2],305397784 ),i1);
fputs(" i1=", vm_out); printarg_i(i1);
}
  ip += 4;
  goto _endif_;
}
if (VM_IS_INST(*ip, 18)) {
  fputs("jump_if_r_lt_l", vm_out);
{
long i0;
vm_Cell2i(IMM_ARG(IPTOS,305397785 ),i0);
fputs(" i0=", vm_out); printarg_i(i0);
}
{
long i1;
vm_Cell2i(IMM_ARG(IP[1],305397786 ),i1);
fputs(" i1=", vm_out); printarg_i(i1);
}
  ip += 3;
  goto _endif_;
}
if (VM_IS_INST(*ip, 19)) {
  fputs("set_rl", vm_out);
{
long i0;
vm_Cell2i(IMM_ARG(IPTOS,305397787 ),i0);
fputs(" i0=", vm_out); printarg_i(i0);
}
{
long i1;
vm_Cell2i(IMM_ARG(IP[1],305397788 ),i1);
fputs(" i1=", vm_out); printarg_i(i1);
}
  ip += 3;
  goto _endif_;
}
if (VM_IS_INST(*ip, 20)) {
  fputs("set_rr", vm_out);
{
long i0;
vm_Cell2i(IMM_ARG(IPTOS,305397789 ),i0);
fputs(" i0=", vm_out); printarg_i(i0);
}
{
long i1;
vm_Cell2i(IMM_ARG(IP[1],305397790 ),i1);
fputs(" i1=", vm_out); printarg_i(i1);
}
  ip += 3;
  goto _endif_;
}
if (VM_IS_INST(*ip, 21)) {
  fputs("end", vm_out);
  ip += 1;
  goto _endif_;
}
if (VM_IS_INST(*ip, 22)) {
  fputs("s_pljl", vm_out);
{
Cell _IP0;
vm_Cell2Cell(IMM_ARG(IPTOS,305397791 ),_IP0);
fputs(" _IP0=", vm_out); printarg_Cell(_IP0);
}
{
Cell _IP1;
vm_Cell2Cell(IMM_ARG(IP[1],305397792 ),_IP1);
fputs(" _IP1=", vm_out); printarg_Cell(_IP1);
}
  ip += 3;
  goto _endif_;
}
