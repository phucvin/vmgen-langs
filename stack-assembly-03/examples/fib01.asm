// compute fib(N) and print the result

@main:
  push #6
  call @fib
  halt ~1

@fib:
  // stack is now s( ret_addr n )
  jump_lt @@base_case ~1 #2  // stack remains the same
  sub ~1 #1  // s(.. n n-1 )
  call @fib  // s(.. n fib(n-1) )
  sub ~2 #2  // s(.. n fib(n-1) n-2 )
  call @fib  // s(.. n fib(n-1) fib(n-2) )
  add  // s( ret_addr n result )
  // return using return address in ~3, return value in ~1
  ret ~3 ~1 // s( result ), control is back to the caller
@@base_case:
  // now s( ret_address result_or_n )
  ret ~2 ~1