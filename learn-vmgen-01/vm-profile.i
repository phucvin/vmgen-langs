if (VM_IS_INST(*ip, 0)) {
  add_inst(b, "push");
  ip += 2;
  goto _endif_;
}
if (VM_IS_INST(*ip, 1)) {
  add_inst(b, "end");
  ip += 1;
  goto _endif_;
}
