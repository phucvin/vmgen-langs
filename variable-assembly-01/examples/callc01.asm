// call C function in a loop

@main:
  begin_vars #1
  set r1 #0
@loop:
  add r1 r1 #1
  ffi_set $0 r1
  ffi_call $sum
  jump_lt @loop r1 #100
@main_end:
  halt r0
