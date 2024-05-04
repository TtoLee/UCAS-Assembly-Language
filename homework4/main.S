.section .data
 testdata:
     .byte 'A', '0', 'z', 'P', '8', 'r', 'Z', '2', 'f', 'H'
.section .text
.globl _start
_start:
    subl $8, %esp
    movl $testdata, 4(%esp)
    movl $10, (%esp)
    call insert_sort

#output
    subl $8, %esp
    movl $testdata, 4(%esp)
    movl $10, (%esp)
    call as_puts
#exit
    call as_exit

.globl insert_sort
    .type insert_sort, @function
insert_sort:
    pushl %ebx
    pushl %esi
    pushl %edi

    movl 20(%esp), %eax
    movl 16(%esp), %ebx 
    movl $0, %edi

loopfor:
    cmp %edi, %ebx
    jl endloopfor
    movb (%eax, %edi, 1), %cl
    movl %edi, %esi
    subl $1, %esi

loopwhile:
    cmp $0, %esi
    jl endloopwhile
    movb (%eax, %esi, 1), %dl
    cmp %dl, %cl
    jg endloopwhile
    movb %dl, 1(%eax, %esi, 1)
    subl $1, %esi
    jmp loopwhile

endloopwhile:
    movb %cl, 1(%eax, %esi, 1)

increment:
    addl $1, %edi
    jmp loopfor

endloopfor:
    popl %edi
    popl %esi
    popl %ebx
    ret $8

.globl as_puts
    .type as_puts, @function
as_puts:
    pushl %ebx
    movl $4, %eax
    movl $1, %ebx
    movl 12(%esp), %ecx
    movl 8(%esp), %edx
    int $0x80
    popl %ebx
    ret $8

.globl as_exit
    .type as_exit, @function
as_exit:
    movl $1, %eax
    movl $0, %ebx
    int $0x80
    ret
