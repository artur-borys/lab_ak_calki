.globl my_sin
.type my_sin, @function

.bss
    .lcomm num, 8

.text
my_sin:
    fldl 4(%esp)
    fldpi
    fmulp
    fsin
    ret
