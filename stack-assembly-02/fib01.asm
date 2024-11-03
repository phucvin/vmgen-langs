// compute fib(N) and print the result

@main:
  call_param #0 #6
  call @fib
  halt

// params/locals: #0=n
// results: 1
@fib:
  // jump to @@base_case if n < 2, fallthrough if not
  local_get #0
  push #2
  jump_if_lt @@fib_base_case 

  local_get #0
  push #1
  sub
  call_param #0
  call @fib
  local_get #0
  push #2
  sub
  call_param #0
  call @fib
  add
  return_param #0
  return

@@base_case:
  local_get #0
  return_param #0
  return