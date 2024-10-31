void gen_push(Inst **ctp, long i0)
{
  gen_inst(ctp, vm_prim[0]);
  genarg_i(ctp, i0);
}
void gen_end(Inst **ctp)
{
  gen_inst(ctp, vm_prim[1]);
}
