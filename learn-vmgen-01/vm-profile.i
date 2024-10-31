if (VM_IS_INST(*ip, 0)) {
  add_inst(b, "push");
  ip += 1;
  goto _endif_;
}
