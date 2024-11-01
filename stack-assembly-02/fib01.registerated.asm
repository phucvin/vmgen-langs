// Transpiled from fib01.asm to use register-based opcodes
// Original lines are comments next to a generated line
// Uncommented lines are same with original

@main:
  li r0 #6  // call_param #0 #6
  push @main_end  // call_ret_addr @main_end
  jump @fib  // call @fib
@main_end:
  puti r0  // puti
  halt

@fib:
  jump_if_lt r0 #2 @fib_end  // local_get #0 // push #2 // jump_if_lt @fib_base_case 
@fib_recursive_case:
  set l0 r0
  sub r0 l0 #1  // local_get #0 // push #1 // sub // call_param #0
  push @fib_recursive_case_01  // call_ret_addr @fib_recursive_case_01
  jump @fib  // call @fib
@fib_recursive_case_01:
  set l1 r0
  sub r0 l0 #2 // local_get #0 // push #2 // sub // call_param #0
  push @fib_recursive_case_01  // call_ret_addr @fib_recursive_case_02
  jump @fib  // call @fib
@fib_recursive_case_02:
  add r0 r0 l1  // add // return_param
@fib_end:
  jump