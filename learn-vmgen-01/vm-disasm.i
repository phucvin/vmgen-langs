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
  fputs("add", vm_out);
  ip += 1;
  goto _endif_;
}
if (VM_IS_INST(*ip, 3)) {
  fputs("add_rrl", vm_out);
{
long i0;
vm_Cell2i(IMM_ARG(IPTOS,305397762 ),i0);
fputs(" i0=", vm_out); printarg_i(i0);
}
{
long i1;
vm_Cell2i(IMM_ARG(IP[1],305397763 ),i1);
fputs(" i1=", vm_out); printarg_i(i1);
}
{
long i2;
vm_Cell2i(IMM_ARG(IP[2],305397764 ),i2);
fputs(" i2=", vm_out); printarg_i(i2);
}
  ip += 4;
  goto _endif_;
}
if (VM_IS_INST(*ip, 4)) {
  fputs("add_rrr", vm_out);
{
long i0;
vm_Cell2i(IMM_ARG(IPTOS,305397765 ),i0);
fputs(" i0=", vm_out); printarg_i(i0);
}
{
long i1;
vm_Cell2i(IMM_ARG(IP[1],305397766 ),i1);
fputs(" i1=", vm_out); printarg_i(i1);
}
{
long i2;
vm_Cell2i(IMM_ARG(IP[2],305397767 ),i2);
fputs(" i2=", vm_out); printarg_i(i2);
}
  ip += 4;
  goto _endif_;
}
if (VM_IS_INST(*ip, 5)) {
  fputs("sub_rrl", vm_out);
{
long i0;
vm_Cell2i(IMM_ARG(IPTOS,305397768 ),i0);
fputs(" i0=", vm_out); printarg_i(i0);
}
{
long i1;
vm_Cell2i(IMM_ARG(IP[1],305397769 ),i1);
fputs(" i1=", vm_out); printarg_i(i1);
}
{
long i2;
vm_Cell2i(IMM_ARG(IP[2],305397770 ),i2);
fputs(" i2=", vm_out); printarg_i(i2);
}
  ip += 4;
  goto _endif_;
}
if (VM_IS_INST(*ip, 6)) {
  fputs("sub_rlr", vm_out);
{
long i0;
vm_Cell2i(IMM_ARG(IPTOS,305397771 ),i0);
fputs(" i0=", vm_out); printarg_i(i0);
}
{
long i1;
vm_Cell2i(IMM_ARG(IP[1],305397772 ),i1);
fputs(" i1=", vm_out); printarg_i(i1);
}
{
long i2;
vm_Cell2i(IMM_ARG(IP[2],305397773 ),i2);
fputs(" i2=", vm_out); printarg_i(i2);
}
  ip += 4;
  goto _endif_;
}
if (VM_IS_INST(*ip, 7)) {
  fputs("sub_rrr", vm_out);
{
long i0;
vm_Cell2i(IMM_ARG(IPTOS,305397774 ),i0);
fputs(" i0=", vm_out); printarg_i(i0);
}
{
long i1;
vm_Cell2i(IMM_ARG(IP[1],305397775 ),i1);
fputs(" i1=", vm_out); printarg_i(i1);
}
{
long i2;
vm_Cell2i(IMM_ARG(IP[2],305397776 ),i2);
fputs(" i2=", vm_out); printarg_i(i2);
}
  ip += 4;
  goto _endif_;
}
if (VM_IS_INST(*ip, 8)) {
  fputs("jump_l", vm_out);
{
Inst * target0;
vm_Cell2target(IMM_ARG(IPTOS,305397777 ),target0);
fputs(" target0=", vm_out); printarg_target(target0);
}
  ip += 2;
  goto _endif_;
}
if (VM_IS_INST(*ip, 9)) {
  fputs("end", vm_out);
  ip += 1;
  goto _endif_;
}
