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
$ make vm && ./vm.out examples/simple01.asm
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