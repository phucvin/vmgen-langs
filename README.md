# vmgen-langs
Interpreted programming languages using vmgen

## Build

Build vmgen:
```
$ mkdir tmp01 && cd tmp01
$ git clone https://github.com/phucvin/gforth
$ cd gforth
$ source ./install-deps.sh
$ vmgen --help
$ sudo apt update && sudo apt install flex -y
$ cd vmgen-myex01
$ make
$ time ./mini fib.mini
result = 102334155
real    0m2.213s
```

Build stack-assembly-01:
```
$ cd stack-assembly-01
$ make vm && time ./vm.out examples/fib01.asm

vm assembly:
0x643741b3f2a0: push_l i0=110188488291016 
0x643741b3f2b0: s_pljl _IP0=0x6  _IP1=0x643741b3f2d0 
0x643741b3f2c8: end
0x643741b3f2d0: dup
0x643741b3f2d8: push_l i0=2 
0x643741b3f2e8: jump_l_if_lt target0=0x643741b3f3a0 
0x643741b3f2f8: dup
0x643741b3f300: push_l i0=1 
0x643741b3f310: sub
0x643741b3f318: push_l i0=110188488291136 
0x643741b3f328: swap
0x643741b3f330: jump_l target0=0x643741b3f2d0 
0x643741b3f340: swap
0x643741b3f348: push_l i0=2 
0x643741b3f358: sub
0x643741b3f360: push_l i0=110188488291208 
0x643741b3f370: swap
0x643741b3f378: jump_l target0=0x643741b3f2d0 
0x643741b3f388: add
0x643741b3f390: swap
0x643741b3f398: jump
0x643741b3f3a0: swap
0x643741b3f3a8: jump

vm run:
return code: 102334155

real    0m3.873s
```

Build register-assembly-01:
```
$ cd register-assembly-01
$ make vm && time ./vm.out examples/fib01.asm

vm assembly:
0x629a870822a0: set_rl i0=0  i1=40 
0x629a870822b8: s_call0 _IP0=0x629a870822d0  _IP1=0x629a870822e0 
0x629a870822d0: halt_r i0=0 
0x629a870822e0: jump_l_if_r_lt_l target0=0x629a870823d0  i0=0  i1=2 
0x629a87082300: push_r i0=0 
0x629a87082310: sub_rrl i0=0  i1=0  i2=1 
0x629a87082330: s_call0 _IP0=0x629a87082348  _IP1=0x629a870822e0 
0x629a87082348: pop_r i0=1 
0x629a87082358: push_r i0=0 
0x629a87082368: sub_rrl i0=0  i1=1  i2=2 
0x629a87082388: s_call0 _IP0=0x629a870823a0  _IP1=0x629a870822e0 
0x629a870823a0: pop_r i0=1 
0x629a870823b0: add_rrr i0=0  i1=0  i2=1 
0x629a870823d0: jump_tos

vm run:
return code: 102334155

real    0m2.135s
```

Build variable-assembly-01:
```
$ cd variable-assembly-01
$ make vm && time ./vm.out examples/fib01.asm

vm assembly:
0x5d2f649c92a0: set_rl i0=0  i1=40 
0x5d2f649c92b8: s_call0 _IP0=0x9  _IP1=0x5d2f649c92d8  _IP2=0x5d2f649c92e8 
0x5d2f649c92d8: halt_r i0=0 
0x5d2f649c92e8: jump_l_if_r_lt_l target0=0x5d2f649c9410  i0=0  i1=2 
0x5d2f649c9308: alloc_v i0=3 
0x5d2f649c9318: set_vr i0=0  i1=0 
0x5d2f649c9330: set_vr i0=1  i1=9 
0x5d2f649c9348: sub_rvl i0=0  i1=0  i2=1 
0x5d2f649c9368: s_call0 _IP0=0x9  _IP1=0x5d2f649c9388  _IP2=0x5d2f649c92e8 
0x5d2f649c9388: set_vr i0=2  i1=0 
0x5d2f649c93a0: sub_rvl i0=0  i1=0  i2=2 
0x5d2f649c93c0: s_call0 _IP0=0x9  _IP1=0x5d2f649c93e0  _IP2=0x5d2f649c92e8 
0x5d2f649c93e0: add_rrv i0=0  i1=0  i2=2 
0x5d2f649c9400: jump_v_dealloc i0=1 
0x5d2f649c9410: jump_r i0=9 

vm run:
return code: 102334155

real    0m2.690s
```

Build stack-assembly-03:
```
$ cd stack-assembly-03
$ make vm && time ./vm.out examples/fib01.asm
vm assembly:
0x6075598892a0: push_l i0=40 
0x6075598892b0: call1 target0=0x6075598892d0 
0x6075598892c0: halt_d i0=1 
0x6075598892d0: jump_l_if_d_lt_l target0=0x607559889360  i0=1  i1=2 
0x6075598892f0: sub_dl i0=1  i1=1 
0x607559889308: call1 target0=0x6075598892d0 
0x607559889318: sub_dl i0=2  i1=2 
0x607559889330: call1 target0=0x6075598892d0 
0x607559889340: add
0x607559889348: ret_dd i0=3  i1=1 
0x607559889360: ret_dd i0=2  i1=1 

vm run:
return code: 102334155

real    0m1.822s
user    0m1.812s
sys     0m0.004s
```
Note that this one is fastest so far probably because it doesn't use frame pointer like in stack-assembly-04.
But generating high-level code to this is harder since it uses delta instead of absolute index for accessing local variables.

Build stack-assembly-04:
```
$ cd stack-assembly-04
$ make vm && time ./vm.out examples/fib01.asm
vm assembly:
0x5b63221792a0: push_l i0=40 
0x5b63221792b0: call1 target0=0x5b63221792c8 
0x5b63221792c0: halt
0x5b63221792c8: jump_l_if_f_lt_l target0=0x5b6322179340  i0=0  i1=2 
0x5b63221792e8: sub_fl i0=0  i1=1 
0x5b6322179300: call1 target0=0x5b63221792c8 
0x5b6322179310: sub_fl i0=0  i1=2 
0x5b6322179328: call1 target0=0x5b63221792c8 
0x5b6322179338: add
0x5b6322179340: ret

vm run:
return code: 102334155

real    0m2.617s
user    0m2.590s
sys     0m0.000s
```

## Appendix

Learn Vmgen:
- http://www.complang.tuwien.ac.at/anton/vmgen/
- See commit history of `learn-vmgen-01`
```
$ cd learn-vmgen-01
$ make vm && time ./vm.out

vm assembly:
0x59ec82ebd2a0: set_rl i0=0  i1=40 
0x59ec82ebd2b8: s_call0 _IP0=0x9  _IP1=0x59ec82ebd2d8  _IP2=0x59ec82ebd2e8 
0x59ec82ebd2d8: end_r i0=0 
0x59ec82ebd2e8: jump_l_if_r_lt_l target0=0x59ec82ebd410  i0=0  i1=2 
0x59ec82ebd308: alloc_v i0=3 
0x59ec82ebd318: set_vr i0=0  i1=0 
0x59ec82ebd330: set_vr i0=1  i1=9 
0x59ec82ebd348: sub_rvl i0=0  i1=0  i2=1 
0x59ec82ebd368: s_call0 _IP0=0x9  _IP1=0x59ec82ebd388  _IP2=0x59ec82ebd2e8 
0x59ec82ebd388: set_vr i0=2  i1=0 
0x59ec82ebd3a0: sub_rvl i0=0  i1=0  i2=2 
0x59ec82ebd3c0: s_call0 _IP0=0x9  _IP1=0x59ec82ebd3e0  _IP2=0x59ec82ebd2e8 
0x59ec82ebd3e0: add_rrv i0=0  i1=0  i2=2 
0x59ec82ebd400: jump_v_dealloc i0=1 
0x59ec82ebd410: jump_r i0=9

vm run:
return code: 102334155

real    0m2.455s
```

Performance of fib(40) in other interpreters:
```
$ time tmp02/wasm3-cosmopolitan.com --func fib tmp02/fib32.wasm 40
Result: 102334155
real    0m4.991s

$ time luajit -joff tmp02/fib01.lua
102334155
real    0m4.504s
```