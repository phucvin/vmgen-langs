// export functions for host to call

// to call other functions, set r8 to function's address
// then set other registers (up to r7) to have the function's arguments
// and then run from @call_r8 until halted, r0 will be returned as return code
@call_r8:
  set r9 @call_r8_end
  jump r8
@call_r8_end:
  halt r0

@f01:
  add r1 r0 #6
  add r0 r0 r1
  sub r0 r0 #3
  jump r9

@f02:
  begin_vars #1
  set v0 r9
  set r9 @f02_end
  jump @f01
@f02_end:
  add r0 r0 #1
  jump v0

@f03:
  begin_vars #3
  set v0 r9
  set v1 r1
  set r9 @f03_a
  jump @f01
@f03_a:
  set v2 r0
  set r0 v1
  set r9 @f03_b
  jump @f01
@f03_b:
  sub r0 r0 v2
  jump_end_vars v0


// $ make vm-debug && time ./vm-debug.out examples/export01.asm @f03 1 3
// calling vm function @f03(1, 3)
// return: 4