.data
	welcome:		.asciz "Program obliczajacy calke oznaczona z logarytmu\n"
	base_prompt:	.asciz "Podstawa logarytmu: "
	a_prompt:		.asciz "a: "
	b_prompt:		.asciz "b: "
	scanf_f_fmt:	.asciz "%lf"
	printf_f_fmt:	.asciz "%lf\n"
	result_fmt:		.asciz "Wynik: %lf\n"

.bss
	.lcomm a, 8
	.lcomm b, 8
	.lcomm base, 8
	.lcomm result, 8

.text
	.globl _start

_start:
	push $welcome
	call printf

	push $base_prompt
	call printf
	push $base
	push $scanf_f_fmt
	call scanf
	
	push $a_prompt
	call printf
	push $a
	push $scanf_f_fmt
	call scanf

	push $b_prompt
	call printf
	push $b
	push $scanf_f_fmt
	call scanf

	call calka

	mov $result, %eax
	push 4(%eax)
	push (%eax)
	push $result_fmt
	call printf

exit:
	mov $1, %eax
	mov $0, %ebx
	int $0x80

ln_x:
	# x w st(0)
	fldl2e
	fld1
	fdivp
	fxch
	fyl2x
	ret

partial_integral:
	# liczba logarytmowana w st(0)
	fst %st(1)
	fldl base(,1)
	call ln_x
	fdivrp
	fxch
	call ln_x
	fld1
	fsubrp
	fmulp
	ret

calka:
	fldl a(,1)
	call partial_integral
	fst %st(1)
	fldl b(,1)
	call partial_integral
	fsubp
	fstpl result(,1)
	ret