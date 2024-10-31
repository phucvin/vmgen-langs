if (VM_IS_INST(*ip, 0)) {
  add_inst(b, "push_l");
  ip += 2;
  goto _endif_;
}
if (VM_IS_INST(*ip, 1)) {
  add_inst(b, "push_r");
  ip += 2;
  goto _endif_;
}
if (VM_IS_INST(*ip, 2)) {
  add_inst(b, "dup");
  ip += 1;
  goto _endif_;
}
if (VM_IS_INST(*ip, 3)) {
  add_inst(b, "add");
  ip += 1;
  goto _endif_;
}
if (VM_IS_INST(*ip, 4)) {
  add_inst(b, "add_rrl");
  ip += 4;
  goto _endif_;
}
if (VM_IS_INST(*ip, 5)) {
  add_inst(b, "add_rrr");
  ip += 4;
  goto _endif_;
}
if (VM_IS_INST(*ip, 6)) {
  add_inst(b, "sub_rrl");
  ip += 4;
  goto _endif_;
}
if (VM_IS_INST(*ip, 7)) {
  add_inst(b, "sub_rlr");
  ip += 4;
  goto _endif_;
}
if (VM_IS_INST(*ip, 8)) {
  add_inst(b, "sub_rrr");
  ip += 4;
  goto _endif_;
}
if (VM_IS_INST(*ip, 9)) {
  add_inst(b, "jump_l");
  ip += 2;
  return;
}
if (VM_IS_INST(*ip, 10)) {
  add_inst(b, "jump_l_if_lt");
  ip += 2;
  return;
}
if (VM_IS_INST(*ip, 11)) {
  add_inst(b, "end");
  ip += 1;
  goto _endif_;
}
