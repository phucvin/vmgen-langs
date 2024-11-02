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
void gen_pop_r(Inst **ctp, long i0)
{
  gen_inst(ctp, vm_prim[2]);
  genarg_i(ctp, i0);
}
void gen_dup(Inst **ctp)
{
  gen_inst(ctp, vm_prim[3]);
}
void gen_swap(Inst **ctp)
{
  gen_inst(ctp, vm_prim[4]);
}
void gen_add(Inst **ctp)
{
  gen_inst(ctp, vm_prim[5]);
}
void gen_add_rrl(Inst **ctp, long i0, long i1, long i2)
{
  gen_inst(ctp, vm_prim[6]);
  genarg_i(ctp, i0);
  genarg_i(ctp, i1);
  genarg_i(ctp, i2);
}
void gen_add_rrr(Inst **ctp, long i0, long i1, long i2)
{
  gen_inst(ctp, vm_prim[7]);
  genarg_i(ctp, i0);
  genarg_i(ctp, i1);
  genarg_i(ctp, i2);
}
void gen_sub(Inst **ctp)
{
  gen_inst(ctp, vm_prim[8]);
}
void gen_sub_rrl(Inst **ctp, long i0, long i1, long i2)
{
  gen_inst(ctp, vm_prim[9]);
  genarg_i(ctp, i0);
  genarg_i(ctp, i1);
  genarg_i(ctp, i2);
}
void gen_sub_rlr(Inst **ctp, long i0, long i1, long i2)
{
  gen_inst(ctp, vm_prim[10]);
  genarg_i(ctp, i0);
  genarg_i(ctp, i1);
  genarg_i(ctp, i2);
}
void gen_sub_rrr(Inst **ctp, long i0, long i1, long i2)
{
  gen_inst(ctp, vm_prim[11]);
  genarg_i(ctp, i0);
  genarg_i(ctp, i1);
  genarg_i(ctp, i2);
}
void gen_push_addr(Inst **ctp, Inst * target0)
{
  gen_inst(ctp, vm_prim[12]);
  genarg_target(ctp, target0);
}
void gen_push_relative_addr(Inst **ctp, long i0)
{
  gen_inst(ctp, vm_prim[13]);
  genarg_i(ctp, i0);
}
void gen_jump(Inst **ctp)
{
  gen_inst(ctp, vm_prim[14]);
}
void gen_jump_l(Inst **ctp, Inst * target0)
{
  gen_inst(ctp, vm_prim[15]);
  genarg_target(ctp, target0);
}
void gen_jump_r(Inst **ctp, long i0)
{
  gen_inst(ctp, vm_prim[16]);
  genarg_i(ctp, i0);
}
void gen_jump_l_if_lt(Inst **ctp, Inst * target0)
{
  gen_inst(ctp, vm_prim[17]);
  genarg_target(ctp, target0);
}
void gen_jump_l_if_r_lt_l(Inst **ctp, Inst * target0, long i0, long i1)
{
  gen_inst(ctp, vm_prim[18]);
  genarg_target(ctp, target0);
  genarg_i(ctp, i0);
  genarg_i(ctp, i1);
}
void gen_jump_if_r_lt_l(Inst **ctp, long i0, long i1)
{
  gen_inst(ctp, vm_prim[19]);
  genarg_i(ctp, i0);
  genarg_i(ctp, i1);
}
void gen_set_rl(Inst **ctp, long i0, long i1)
{
  gen_inst(ctp, vm_prim[20]);
  genarg_i(ctp, i0);
  genarg_i(ctp, i1);
}
void gen_set_rr(Inst **ctp, long i0, long i1)
{
  gen_inst(ctp, vm_prim[21]);
  genarg_i(ctp, i0);
  genarg_i(ctp, i1);
}
void gen_end(Inst **ctp)
{
  gen_inst(ctp, vm_prim[22]);
}
void gen_end_r(Inst **ctp, long i0)
{
  gen_inst(ctp, vm_prim[23]);
  genarg_i(ctp, i0);
}
void gen_set_r0l(Inst **ctp, long i0)
{
  gen_inst(ctp, vm_prim[24]);
  genarg_i(ctp, i0);
}
void gen_set_r1l(Inst **ctp, long i0)
{
  gen_inst(ctp, vm_prim[25]);
  genarg_i(ctp, i0);
}
void gen_push_r0(Inst **ctp)
{
  gen_inst(ctp, vm_prim[26]);
}
void gen_push_r1(Inst **ctp)
{
  gen_inst(ctp, vm_prim[27]);
}
void gen_pop_r1(Inst **ctp)
{
  gen_inst(ctp, vm_prim[28]);
}
void gen_add_r0r0r0(Inst **ctp)
{
  gen_inst(ctp, vm_prim[29]);
}
void gen_add_r0r0r1(Inst **ctp)
{
  gen_inst(ctp, vm_prim[30]);
}
void gen_sub_r0r0l(Inst **ctp, long i0)
{
  gen_inst(ctp, vm_prim[31]);
  genarg_i(ctp, i0);
}
void gen_sub_r0r1l(Inst **ctp, long i0)
{
  gen_inst(ctp, vm_prim[32]);
  genarg_i(ctp, i0);
}
void gen_jump_r1(Inst **ctp)
{
  gen_inst(ctp, vm_prim[33]);
}
void gen_jump_l_if_r0_lt_l(Inst **ctp, Inst * target0, long i0)
{
  gen_inst(ctp, vm_prim[34]);
  genarg_target(ctp, target0);
  genarg_i(ctp, i0);
}
void gen_alloc_v(Inst **ctp, long i0)
{
  gen_inst(ctp, vm_prim[35]);
  genarg_i(ctp, i0);
}
void gen_set_vr(Inst **ctp, long i0, long i1)
{
  gen_inst(ctp, vm_prim[36]);
  genarg_i(ctp, i0);
  genarg_i(ctp, i1);
}
void gen_sub_rvl(Inst **ctp, long i0, long i1, long i2)
{
  gen_inst(ctp, vm_prim[37]);
  genarg_i(ctp, i0);
  genarg_i(ctp, i1);
  genarg_i(ctp, i2);
}
void gen_add_rrv(Inst **ctp, long i0, long i1, long i2)
{
  gen_inst(ctp, vm_prim[38]);
  genarg_i(ctp, i0);
  genarg_i(ctp, i1);
  genarg_i(ctp, i2);
}
void gen_jump_v_dealloc(Inst **ctp, long i0)
{
  gen_inst(ctp, vm_prim[39]);
  genarg_i(ctp, i0);
}
