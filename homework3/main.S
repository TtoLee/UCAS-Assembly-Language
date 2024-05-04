.section .data
    iostring: .asciz "ab1g2hA0H56po9wK78nB"

.section .text

.globl _start
_start:
    movl $20, %eax
    movl $0, %ebx
    movl $iostring, %edx
    cmpl %ebx, %eax
    jl endloop
loop1:
    cmpl %ebx, %eax
    jl endloop
    movb (%edx, %ebx, 1), %cl
    cmpb $'a', %cl
    jb increment
    cmpb $'z', %cl
    ja increment

    subb $32, %cl
    movb %cl, (%edx, %ebx, 1)
increment:
    addl $1, %ebx
    jmp loop1
endloop:
    #output 
    movl $4, %eax
    movl $1, %ebx
    movl $iostring, %ecx
    movl $20, %edx
    int $0x80
    #exit
    movl $1, %eax
    movl $0, %ebx
    int $0x80
