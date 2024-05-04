.section .data
    stringvar: .ascii "0123456789abcdefS"

.section .text

.globl _start
_start:
    movl $8, %ecx
    movl $stringvar, %ebx
loop1:
    movw -2(%ebx, %ecx, 2), %ax
    movb %al, -1(%ebx, %ecx, 2)
    movb %ah, -2(%ebx, %ecx, 2)
    loop loop1

    #output
    movl $4, %eax
    movl $1, %ebx
    movl $stringvar, %ecx
    movl $16, %edx
    int $0x80

    #exit
    movl $1, %eax
    movl $0, %ebx
    int $0x80
