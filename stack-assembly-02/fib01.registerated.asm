// Transpiled from fib01.asm to use register-based opcodes
// Original lines are comments next to a generated line
// Uncommented lines are same with original

@main:
  set r0 #6  // call_param #0 #6
  push @main_L001  // call @fib
  jump @fib  // (cont)
@main_L001:
  halt_r r0  // halt

@fib:
  jump_if_lt r0 #2 @fib_L001 // local_get #0 // push #2 // jump_if_lt @@base_case
  push r0  // (prev)
  sub r0 r0 #1  // local_get #0 // push #1 // sub // call_param #0
  push @fib_L002  // call @fib
  jump @fib  // (cont)
@fib_L002:
  push r0  // (prev)
  sub r0 l0 #2  // local_get #0 // push #2 // sub // call_param #0
  push @fib_L003  // call @fib
  jump @fib  // (cont)
@fib_L003:
  pop r1  // add // return_param #0
  add r0 r0 r1  // (cont)
  jump  // return
@fib_L001:
  jump // local_get #0 // return_param #0 // return