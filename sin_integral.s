.data
    welcome: .asciz "Program obliczajacy calke oznaczona z funkcji sinus\n"
    float_printf_fmt: .asciz "Wynik: %lf\n"
	float_scanf_fmt: .asciz "%lf"
    prompt_a: .asciz "Podaj a: "
    prompt_b: .asciz "Podaj b: "

.bss
    .lcomm a, 8
    .lcomm b, 8
	.lcomm a_rad, 8
	.lcomm b_rad, 8
	.lcomm wynik, 8
    .lcomm a_user, 8

.text
	.globl _start

_start:
    push $welcome
    call printf
    push $prompt_a
    call printf
    push $a
    push $float_scanf_fmt
    call scanf

    push $prompt_b
    call printf
    push $b
    push $float_scanf_fmt
    call scanf

	call calka

	mov $wynik, %eax
    push 4(%eax)
    push (%eax)
	push $float_printf_fmt
	call printf
exit:
	mov $1, %eax
	mov $0, %ebx
	int $0x80

calka:
	# Funkcja, ktora oblicza calke o oznaczona z funkcji sinus
	# tzn. -cos(b*PI) - (-cos(a*PI))

	finit
	# zamiana a na radiany (przyjumujemy, ze a jest wspolczynnikiem przy pi
	# tj. np. a*pi = 1*pi
	fldl a(,1)
	fldpi
	fmulp
	fstpl a_rad(,1) # przechowanie a*pi w a_rad
	fldl b(,1)
	fldpi
	fmulp	# b*pi jest teraz w st(0)
	fcos	# obliczenie cos(b_rad) do st(0)
	fchs # zmiana znaku, bo calka z sin = -cos
	fldl a_rad(,1)
	fcos	# obliczenie cos(a_rad) do st(0)
	# nie trzeba zamieniac znaku, bo -cos(b) -(-cos(a)) = -cos(b) + cos(a)
	faddp
	fstpl wynik(,1)
ret