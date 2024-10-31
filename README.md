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
$ make
$ time ./vm.out fib_old.asm
```

## Appendix

Learn Vmgen:
- http://www.complang.tuwien.ac.at/anton/vmgen/
- See commit history of `learn-vmgen-01`
```
$ cd learn-vmgen-01
$ make vm && time vm.out
vm assembly:
0x5974517422a0: s_call1 _IP0=0x0  _IP1=0x28  _IP2=0x1  _IP3=0x5974517422d0  _IP4=0x5974517422e8 
0x5974517422d0: push_r i0=0 
0x5974517422e0: end
0x5974517422e8: push_r i0=1 
0x5974517422f8: jump_l_if_r_lt_l target0=0x5974517423f8  i0=0  i1=2 
0x597451742318: push_r i0=0 
0x597451742328: sub_rrl i0=0  i1=0  i2=1 
0x597451742348: s_call0 _IP0=0x1  _IP1=0x597451742368  _IP2=0x5974517422e8 
0x597451742368: pop_r i0=1 
0x597451742378: push_r i0=0 
0x597451742388: sub_rrl i0=0  i1=1  i2=2 
0x5974517423a8: s_call0 _IP0=0x1  _IP1=0x5974517423c8  _IP2=0x5974517422e8 
0x5974517423c8: pop_r i0=1 
0x5974517423d8: add_rrr i0=0  i1=0  i2=1 
0x5974517423f8: jump

vm run:
return code: 102334155

real    0m3.028s
```