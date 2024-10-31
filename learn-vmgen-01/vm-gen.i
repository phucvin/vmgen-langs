void gen_push(Inst **ctp)
{
  gen_inst(ctp, vm_prim[0]);
}
void gen_end(Inst **ctp)
{
  gen_inst(ctp, vm_prim[1]);
}
