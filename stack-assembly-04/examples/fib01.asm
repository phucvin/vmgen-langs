// compute fib(N) and print the result

@main:
  push #40
  call @fib #1  // call with 1 parameter already pushed on the stack
  halt

@fib:
  // stack is now s(| n )
  jump_lt @@base_case |0 #2  // stack remains the same
  sub |0 #1  // s(| n n-1 )
  call @fib #1  // s(| n fib(n-1) )
  sub |0 #2  // s(| n fib(n-1) n-2 )
  call @fib #1  // s(| n fib(n-1) fib(n-2) )
  add  // s(| n result )
  ret  // s(.. result )
@@base_case:
  ret |0  // s(.. n )