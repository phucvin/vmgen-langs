if (VM_IS_INST(*ip, 0)) {
  fputs("push", vm_out);
  ip += 1;
  goto _endif_;
}
if (VM_IS_INST(*ip, 1)) {
  fputs("end", vm_out);
  ip += 1;
  goto _endif_;
}
