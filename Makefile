log_integral: log_integral.o
	ld -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -o log_integral log_integral.o -lc
log_integral.o: log_integral.s
	as --32 -g log_integral.s -o log_integral.o
sin_integral: sin_integral.o
	ld -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -o sin_integral sin_integral.o -lc
sin_integral.o: sin_integral.s
	as --32 -g sin_integral.s -o sin_integral.o
stack_trace: stack_trace.o
	ld -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -o stack_trace stack_trace.o -lc
stack_trace.o: stack_trace.s
	as --32 -g stack_trace.s -o stack_trace.o

my_sin: my_sin.c my_lib.s
	gcc -m32 -g my_sin.c my_lib.s -o my_sin