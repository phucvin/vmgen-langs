// compute fib(N) and print the result

@main:
  push #40
  call @fib #1  // call with 1 parameter already pushed on the stack
  halt

@fib:
  // stack is now s(| n )
  load |0, push #2, jump_lt @@end  // stack remains the same
  load |0, push #1, sub  // s(| n n-1 )
  call @fib #1  // s(| n fib(n-1) )
  load |0, push #2, sub  // s(| n fib(n-1) n-2 )
  call @fib #1  // s(| n fib(n-1) fib(n-2) )
  add  // s(| n result )
@@end:
  ret  // s(.. n_or_result )