.text
	.globl my_sin
	.type my_sin, @function
my_sin:
	push %ebp
	mov %esp, %ebp
	fldl 8(%ebp)
	fldpi
	fmulp
	fsin
	mov %ebp, %esp
	pop %ebp
	ret
