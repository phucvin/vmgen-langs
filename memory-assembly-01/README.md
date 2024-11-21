This language operates on a fixed-size buffer of memory, and there is no stack, no recursion, no dynamic allocation. But it's turing-complete (since it can run forever).

Print 1 to n:
```
// This is required as the first instruction, telling how many bytes the memory should have
mem #16
// Allow the client to know where to set a variable by name.
// The client has to set it to desired value before calling a function
i32.in "n" m4_n

@main:
  i32.set m0_i #0
@@loop:
  // Jump to @end if i32 starting at memory address 0 is greater than the one staring at address 4
  i32.jump_gt @@end m0_i, m4_n
  i32.print m0_i
  // Add 1 to the i32 at address 0 and save the result to i32 at address 0
  i32.add m0_i m0_i #1
  jump @@loop
@@end:
  halt
```
