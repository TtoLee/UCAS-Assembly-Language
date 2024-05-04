.section .data
    hello: .ascii "University of CAS\n"
.section .text

.globl _start
_start:
movq    $1, %rax
movq    $1, %rdi
movq    $hello, %rsi
movq    $18, %rdx
syscall

movq    $60, %rax
movq    $0, %rdi
syscall

