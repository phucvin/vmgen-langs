// call C function in a loop

@main:
  begin_vars #1
  set r1 #0
  set r2 #0
@loop:
  add r1 r1 #1
  ffi_call $abs r1
  add r2 r2 r0
  jump_lt @loop r1 #100000000
@main_end:
  halt r2


// $ cd .. && make vm && time ./vm.out examples/callc01.asm
// return code: 5000000050000000
// real    0m0.456s

// this is 20x faster than luajit -joff using luaffi, see /tmp02/callc01.lua