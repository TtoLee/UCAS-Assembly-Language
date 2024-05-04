.section .data
    hex_chars: .string "0123456789abcdef"
    char_to_print: .byte 0
.section .text

.globl print_hex
.type print_hex, @function
print_hex:
    pushl %ebp
    movl %esp, %ebp
    subl $40, %esp

    movl 8(%ebp), %eax
    testl %eax, %eax
    jns print_hex_positive

    subl $8, %esp
    movb $'-', char_to_print
    movl $char_to_print, 4(%esp)
    movl $1, (%esp)
    call as_puts
    negl %eax

print_hex_positive:
    movl $0, %edi
    movl $0, %esi

convert_loop:
    movl %eax, %edx
    andl $15, %edx
    movb hex_chars(%edx), %cl
    movl %ecx, (%esp, %edi, 4)
    shrl $4, %eax
    incl %edi
    cmp $8, %edi
    jle convert_loop

    subl $8, %esp
    movb $'0', char_to_print
    movl $char_to_print, 4(%esp)
    movl $1, (%esp)
    call as_puts

    subl $8, %esp
    movb $'x', char_to_print
    movl $char_to_print, 4(%esp)
    movl $1, (%esp)
    call as_puts

print_loop:
    subl $8, %esp
    movl (%esp, %edi, 4), %ecx
    movb %cl, char_to_print
    movl $char_to_print, 4(%esp)
    movl $1, (%esp)
    call as_puts
    decl %edi
    cmp $0, %edi
    jne print_loop

    addl $40, %esp
    popl %ebp

    ret $4

.globl as_puts
.type as_puts, @function
as_puts:
    pushl %ebx
    pushl %eax

    movl $4, %eax
    movl $1, %ebx
    movl 16(%esp), %ecx
    movl 12(%esp), %edx
    int $0x80
    popl %eax
    popl %ebx
    ret $8

.globl as_exit
    .type as_exit, @function
as_exit:
    movl $1, %eax
    movl $0, %ebx
    int $0x80
    ret
