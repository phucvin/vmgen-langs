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
0x6148197082a0: set_r0l i0=40 
0x6148197082b0: set_r1l i0=106962292343504 
0x6148197082c0: jump_l target0=0x6148197082e0 
0x6148197082d0: push_r0
0x6148197082d8: end
0x6148197082e0: push_r1
0x6148197082e8: jump_l_if_r0_lt_l target0=0x614819708388  i0=2 
0x614819708300: push_r0
0x614819708308: sub_r0r0l i0=1 
0x614819708318: set_r1l i0=106962292343608 
0x614819708328: jump_l target0=0x6148197082e0 
0x614819708338: pop_r1
0x614819708340: push_r0
0x614819708348: sub_r0r1l i0=2 
0x614819708358: set_r1l i0=106962292343672 
0x614819708368: jump_l target0=0x6148197082e0 
0x614819708378: pop_r1
0x614819708380: add_r0r0r1
0x614819708388: jump

vm run:
return code: 102334155

real    0m2.223s
```