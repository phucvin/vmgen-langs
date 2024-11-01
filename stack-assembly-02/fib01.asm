// compute fib(N) and print the result

@main:
  call_param #0 #6
  call_ret_addr @main_end
  call @fib
@main_end:
  puti
  halt

// params/locals #0=n
@fib:
  local_get #0
  push #2
// jump to @fib_base_case if n < 2, fallthrough if not
  jump_if_lt @fib_base_case 
@fib_recursive_case:
  local_get #0
  push #1
  sub
  call_param #0
  call_ret_addr @fib_recursive_case_01
  call @fib
@fib_recursive_case_01:
  local_get #0
  push #2
  sub
  call_param #0
  call_ret_addr @fib_recursive_case_02
  call @fib
@fib_recursive_case_02:
  add
  return_param
  return
@fib_base_case:
  local_get #0
  return_param #0
  return