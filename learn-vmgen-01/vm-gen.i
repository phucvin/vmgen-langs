void gen_push_l(Inst **ctp, long i0)
{
  gen_inst(ctp, vm_prim[0]);
  genarg_i(ctp, i0);
}
void gen_push_r(Inst **ctp, long i0)
{
  gen_inst(ctp, vm_prim[1]);
  genarg_i(ctp, i0);
}
void gen_dup(Inst **ctp)
{
  gen_inst(ctp, vm_prim[2]);
}
void gen_swap(Inst **ctp)
{
  gen_inst(ctp, vm_prim[3]);
}
void gen_add(Inst **ctp)
{
  gen_inst(ctp, vm_prim[4]);
}
void gen_add_rrl(Inst **ctp, long i0, long i1, long i2)
{
  gen_inst(ctp, vm_prim[5]);
  genarg_i(ctp, i0);
  genarg_i(ctp, i1);
  genarg_i(ctp, i2);
}
void gen_add_rrr(Inst **ctp, long i0, long i1, long i2)
{
  gen_inst(ctp, vm_prim[6]);
  genarg_i(ctp, i0);
  genarg_i(ctp, i1);
  genarg_i(ctp, i2);
}
void gen_sub(Inst **ctp)
{
  gen_inst(ctp, vm_prim[7]);
}
void gen_sub_rrl(Inst **ctp, long i0, long i1, long i2)
{
  gen_inst(ctp, vm_prim[8]);
  genarg_i(ctp, i0);
  genarg_i(ctp, i1);
  genarg_i(ctp, i2);
}
void gen_sub_rlr(Inst **ctp, long i0, long i1, long i2)
{
  gen_inst(ctp, vm_prim[9]);
  genarg_i(ctp, i0);
  genarg_i(ctp, i1);
  genarg_i(ctp, i2);
}
void gen_sub_rrr(Inst **ctp, long i0, long i1, long i2)
{
  gen_inst(ctp, vm_prim[10]);
  genarg_i(ctp, i0);
  genarg_i(ctp, i1);
  genarg_i(ctp, i2);
}
void gen_push_addr(Inst **ctp, Inst * target0)
{
  gen_inst(ctp, vm_prim[11]);
  genarg_target(ctp, target0);
}
void gen_push_relative_addr(Inst **ctp, long i0)
{
  gen_inst(ctp, vm_prim[12]);
  genarg_i(ctp, i0);
}
void gen_jump(Inst **ctp)
{
  gen_inst(ctp, vm_prim[13]);
}
void gen_jump_l(Inst **ctp, Inst * target0)
{
  gen_inst(ctp, vm_prim[14]);
  genarg_target(ctp, target0);
}
void gen_jump_l_if_lt(Inst **ctp, Inst * target0)
{
  gen_inst(ctp, vm_prim[15]);
  genarg_target(ctp, target0);
}
void gen_set_rl(Inst **ctp, long i0, long i1)
{
  gen_inst(ctp, vm_prim[16]);
  genarg_i(ctp, i0);
  genarg_i(ctp, i1);
}
void gen_set_rr(Inst **ctp, long i0, long i1)
{
  gen_inst(ctp, vm_prim[17]);
  genarg_i(ctp, i0);
  genarg_i(ctp, i1);
}
void gen_end(Inst **ctp)
{
  gen_inst(ctp, vm_prim[18]);
}
