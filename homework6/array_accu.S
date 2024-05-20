.section .data
.section .text

.globl array_accu
.type array_accu, @function
array_accu:
//rdi: pointer to array
//rsi: size of array
    pushq %rbp
    movq %rsp, %rbp
    subq $8, %rsp
    subq $1, %rsi
    movsd (%rdi, %rsi, 8), %xmm0

    cmp $0, %rsi
    jle end_loop
loop: 
    subq $1, %rsi
    movsd (%rdi, %rsi, 8), %xmm1
    addsd %xmm1, %xmm0
    cmp $0, %rsi
    jg loop

end_loop:
    movsd %xmm0, (%rsp)
    fldl (%rsp)
    addq $8, %rsp
    popq %rbp
    ret