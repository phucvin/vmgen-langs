halt

// comment

@main:
// prepare to call fib :: s( return_address n ) > s( n )
  push @main_end
  push #6
  jump @fib
@main_end:
  halt

dup
add #1
sub
swap
