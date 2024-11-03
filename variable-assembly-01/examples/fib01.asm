// compute fib(N) and print the result

@main:
  set r0 #6
  set rx @main_end
  jump @fib
@main_end:
  puti r0
  halt

@fib:
  jump_if_lt r0 #2 @fib_end
@fib_recursive_case:
  // allocate spaces for variables (won't change when making calls)
  alloc_v #3
  // save registers to variables since we're going to make calls
  set v0 r0
  set v1 rx
  sub r0 v0 #1
  set rx @fib_recursive_case_01
  jump @fib
@fib_recursive_case_01:
  set v2 r0
  sub r0 v0 #2
  push @fib_recursive_case_02
  jump @fib
@fib_recursive_case_02:
  add r0 r0 v2
  dealloc_v #3
  jump v1
@fib_base_case:
  // here we don't even needs to access variables since we didn't make any calls
  // registers are still the same with when we enter this function
  jump rx