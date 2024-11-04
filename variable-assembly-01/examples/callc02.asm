// call C function with 2 arguments

@main:
  set r0 #14
  set r1 #6
  ffi_call $my_sub r0 r1
@main_end:
  halt r0


// note: this currently works on x86_64 Linux since the interpreter only has
// code for this calling convention