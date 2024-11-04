// call C function in a loop

@main:
  begin_vars #1
  set r1 #0
  set r2 #0
@loop:
  add r1 r1 #1
  ffi_arg1 r1
  ffi_call $abs
  add r2 r2 r0
  jump_lt @loop r1 #3
@main_end:
  halt r2
