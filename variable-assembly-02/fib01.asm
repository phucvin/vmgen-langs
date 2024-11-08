// compute fib(N) and print the result

@main:
  v0 = call @fib #40
  halt v0

@fib:
  jump_lt @@base_case v0 #2
  v1 = sub v0 #1
  v2 = call @fib v1
  v3 = sub v0 #2
  v4 = call @fib v3
  v5 = add v2, v4
  ret v5
@@base_case:
  ret v0