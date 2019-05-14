.align 32
.data
	hex_fmt: .asciz "%#x\n"
.text
	.globl _start
_start:
	mov $0, %ebp
	call f1

exit:
	mov $1, %eax
	mov $0, %ebx
	int $0x80

f1:
	push %ebp
	mov %esp, %ebp
	call f2
	leave
	ret
f2:
	push %ebp
	mov %esp, %ebp
	push $2
	call stack_trace
	leave
	ret

stack_trace:
	# Funkcja wyswietla stack trace
	# Argumenty:
	#	- ilosc adresow do wyswietlenia
	push %ebp
	mov %esp, %ebp
	sub $8, %esp
	mov %edi, -4(%esp)
	mov %ebx, -8(%esp)

	mov 8(%esp), %ebx
	mov 16(%esp), %ecx
l1:
	test %ebx, %ebx
	jz finish_stack_trace
	push 4(%ebx)
	mov (%ebx), %ebx
	push $hex_fmt
	call printf
	add $8, %esp
	loop l1
finish_stack_trace:
	mov -4(%ebp), %edi
	mov -8(%ebp), %ebx
	mov %ebp, %esp
	pop %ebp
	ret
