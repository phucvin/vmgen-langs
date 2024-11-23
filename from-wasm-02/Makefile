VMGEN=vmgen
GCC=gcc -O3 -fomit-frame-pointer -Wall
CC=$(GCC)

vm: main.o peephole.o profile.o disasm.o engine.o
	$(CC) main.o peephole.o profile.o disasm.o engine.o -o vm.out

vm-debug: main-debug.o peephole.o profile.o disasm.o engine-debug.o
	$(CC) main-debug.o peephole.o profile.o disasm.o engine-debug.o -o vm-debug.out

vm-profile: main-profile.o peephole.o profile.o disasm.o engine-profile.o
	$(CC) main-profile.o peephole.o profile.o disasm.o engine-profile.o -o vm-profile.out

vm-vm.i vm-disasm.i vm-gen.i vm-labels.i vm-profile.i vm-peephole.i: vm.vmg
	$(VMGEN) vm.vmg

main.o: main.c vm.h

main-debug.o: main.c vm.h vm-gen.i
	$(CC) -DVM_DEBUG -c -o $@ main.c

main-profile.o: main.c vm.h vm-gen.i
	$(CC) -DVM_PROFILING -c -o $@ main.c

peephole.o: peephole.c vm-peephole.i vm.h

profile.o: profile.c vm-profile.i vm.h

disasm.o: disasm.c vm-disasm.i vm.h

engine.o: engine.c vm-vm.i vm-labels.i vm.h

engine-debug.o: engine.c vm-vm.i vm-labels.i vm.h
	$(CC) -DVM_DEBUG -Dengine=engine_debug -c -o $@ engine.c

engine-profile.o: engine.c vm-vm.i vm-labels.i vm.h
	$(CC) -DVM_PROFILING -c -o $@ engine.c

clean:
	rm -f *.o *.out
