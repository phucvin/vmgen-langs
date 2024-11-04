// call C function in a loop

@main:
  begin_vars 1
  set v0 #4
  set r0 #2
  // prepare to call a C/FFI function, arguments need to be in registers
  add r0 r0 v0
  set r1 #2
  // call specifiying the numbers of arguments
  ffi_call $sum #2
  // result is in r0
@main_end:
  halt r0
