log_integral: log_integral.o
	ld -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -o log_integral log_integral.o -lc
log_integral.o: log_integral.s
	as --32 -g log_integral.s -o log_integral.o
sin_integral: sin_integral.o
	ld -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -o sin_integral sin_integral.o -lc
sin_integral.o: sin_integral.s
	as --32 -g sin_integral.s -o sin_integral.o