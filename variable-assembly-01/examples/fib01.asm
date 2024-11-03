// compute fib(N) and print the result

@main:
  set r0 #40
  set r9 @main_end
  jump @fib
@main_end:
  halt r0

@fib:
  jump_lt @fib_base_case r0 #2
@fib_recursive_case:
  // allocate spaces for variables (won't change when making calls)
  begin_vars #3
  // save registers to variables since we're going to make calls
  set v0 r0
  set v1 r9
  sub r0 v0 #1
  set r9 @fib_recursive_case_01
  jump @fib
@fib_recursive_case_01:
  set v2 r0
  sub r0 v0 #2
  set r9 @fib_recursive_case_02
  jump @fib
@fib_recursive_case_02:
  add r0 r0 v2
  jump_end_vars v1
@fib_base_case:
  // here we don't even needs to access variables since we didn't make any calls
  // registers are still the same with when we enter this function
  jump r9