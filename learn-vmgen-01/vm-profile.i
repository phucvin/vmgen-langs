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
  add_inst(b, "pop_r");
  ip += 2;
  goto _endif_;
}
if (VM_IS_INST(*ip, 3)) {
  add_inst(b, "dup");
  ip += 1;
  goto _endif_;
}
if (VM_IS_INST(*ip, 4)) {
  add_inst(b, "swap");
  ip += 1;
  goto _endif_;
}
if (VM_IS_INST(*ip, 5)) {
  add_inst(b, "add");
  ip += 1;
  goto _endif_;
}
if (VM_IS_INST(*ip, 6)) {
  add_inst(b, "add_rrl");
  ip += 4;
  goto _endif_;
}
if (VM_IS_INST(*ip, 7)) {
  add_inst(b, "add_rrr");
  ip += 4;
  goto _endif_;
}
if (VM_IS_INST(*ip, 8)) {
  add_inst(b, "sub");
  ip += 1;
  goto _endif_;
}
if (VM_IS_INST(*ip, 9)) {
  add_inst(b, "sub_rrl");
  ip += 4;
  goto _endif_;
}
if (VM_IS_INST(*ip, 10)) {
  add_inst(b, "sub_rlr");
  ip += 4;
  goto _endif_;
}
if (VM_IS_INST(*ip, 11)) {
  add_inst(b, "sub_rrr");
  ip += 4;
  goto _endif_;
}
if (VM_IS_INST(*ip, 12)) {
  add_inst(b, "push_addr");
  ip += 2;
  goto _endif_;
}
if (VM_IS_INST(*ip, 13)) {
  add_inst(b, "push_relative_addr");
  ip += 2;
  goto _endif_;
}
if (VM_IS_INST(*ip, 14)) {
  add_inst(b, "jump");
  ip += 1;
  return;
}
if (VM_IS_INST(*ip, 15)) {
  add_inst(b, "jump_l");
  ip += 2;
  return;
}
if (VM_IS_INST(*ip, 16)) {
  add_inst(b, "jump_r");
  ip += 2;
  return;
}
if (VM_IS_INST(*ip, 17)) {
  add_inst(b, "jump_l_if_lt");
  ip += 2;
  return;
}
if (VM_IS_INST(*ip, 18)) {
  add_inst(b, "jump_l_if_r_lt_l");
  ip += 4;
  return;
}
if (VM_IS_INST(*ip, 19)) {
  add_inst(b, "jump_if_r_lt_l");
  ip += 3;
  return;
}
if (VM_IS_INST(*ip, 20)) {
  add_inst(b, "set_rl");
  ip += 3;
  goto _endif_;
}
if (VM_IS_INST(*ip, 21)) {
  add_inst(b, "set_rr");
  ip += 3;
  goto _endif_;
}
if (VM_IS_INST(*ip, 22)) {
  add_inst(b, "end");
  ip += 1;
  goto _endif_;
}
if (VM_IS_INST(*ip, 23)) {
  add_inst(b, "end_r");
  ip += 2;
  goto _endif_;
}
if (VM_IS_INST(*ip, 24)) {
  add_inst(b, "set_r0l");
  ip += 2;
  goto _endif_;
}
if (VM_IS_INST(*ip, 25)) {
  add_inst(b, "set_r1l");
  ip += 2;
  goto _endif_;
}
if (VM_IS_INST(*ip, 26)) {
  add_inst(b, "push_r0");
  ip += 1;
  goto _endif_;
}
if (VM_IS_INST(*ip, 27)) {
  add_inst(b, "push_r1");
  ip += 1;
  goto _endif_;
}
if (VM_IS_INST(*ip, 28)) {
  add_inst(b, "pop_r1");
  ip += 1;
  goto _endif_;
}
if (VM_IS_INST(*ip, 29)) {
  add_inst(b, "add_r0r0r0");
  ip += 1;
  goto _endif_;
}
if (VM_IS_INST(*ip, 30)) {
  add_inst(b, "add_r0r0r1");
  ip += 1;
  goto _endif_;
}
if (VM_IS_INST(*ip, 31)) {
  add_inst(b, "sub_r0r0l");
  ip += 2;
  goto _endif_;
}
if (VM_IS_INST(*ip, 32)) {
  add_inst(b, "sub_r0r1l");
  ip += 2;
  goto _endif_;
}
if (VM_IS_INST(*ip, 33)) {
  add_inst(b, "jump_r1");
  ip += 1;
  return;
}
if (VM_IS_INST(*ip, 34)) {
  add_inst(b, "jump_l_if_r0_lt_l");
  ip += 3;
  return;
}
if (VM_IS_INST(*ip, 35)) {
  add_inst(b, "alloc_v");
  ip += 2;
  goto _endif_;
}
if (VM_IS_INST(*ip, 36)) {
  add_inst(b, "set_vr");
  ip += 3;
  goto _endif_;
}
if (VM_IS_INST(*ip, 37)) {
  add_inst(b, "sub_rvl");
  ip += 4;
  goto _endif_;
}
if (VM_IS_INST(*ip, 38)) {
  add_inst(b, "add_rrv");
  ip += 4;
  goto _endif_;
}
if (VM_IS_INST(*ip, 39)) {
  add_inst(b, "jump_v_dealloc_v");
  ip += 3;
  return;
}
if (VM_IS_INST(*ip, 40)) {
  add_inst(b, "s_pljl");
  ip += 3;
  return;
}
