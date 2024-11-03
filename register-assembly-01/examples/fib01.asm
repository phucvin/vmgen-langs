// compute fib(N) and print the result

@main:
// prepare to call fib :: r( r0=n ) s( return_address ) -> r( r0=result ) s()
  li r0 #6
  push @main_end
  jump @fib
@main_end:
  puti r0
  halt

// fib :: r( r0=n ) s( return_address ) -> r( r0=result ) s()
@fib:
// jump to @fib_end if n < 2, fallthrough if not
  jump_if_lt r0 #2 @fib_end
@fib_recursive_case:
// save r0
  push r0
// call fib(n-1)
  sub r0 #1
  push @fib_recursive_case_01
  jump @fib
@fib_recursive_case_01:
// pop saved n to r1
  pop r1
// save fib(n-1), now in r0
  push r0
// call fib(n-2)
  sub_to r0 r1 #2
  push @fib_recursive_case_02
  jump @fib
@fib_recursive_case_02:
// pop saved fib(n-1) to r1
  pop r1
  add_to r0 r0 r1
// fallthrough to return
@fib_end:
// in both cases, now r( r0=result ) s( return_address )
  jump_tos