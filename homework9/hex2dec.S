.section .data
.section .text

.globl hex2dec
.type hex2dec, @function
hex2dec:
    addi $sp, $sp, -20
    addi $t0, $sp, 0
    sw $ra, 16($sp)
    sw $a0, 12($sp)
    beq $a0, $0, EX
    li $t1, 10
    li $t3, 0

L1:
    li $t2, 0
    divu $a0, $t1
    mflo $a0
    mfhi $t2

    addi $t2, $t2, '0'
    sb $t2, 0($t0)
    addi $t3, $t3, 1
    addi $t0, $t0, 1
    bnez $a0, L1
    nop

    j L2
    nop

EX:
    addi $t2, $0, '0'
    sb $t2, 0($t0)
    addi $t3, $t3, 1
    addi $t0, $t0, 1

L2:
    addiu $t0, $t0, -1

    addiu $v0, $0, 4004
    li $a0, 0
    addiu $a1, $t0, 0
    li $a2, 1
    syscall

    addiu $t3, $t3, -1
    bnez $t3, L2
    nop

    addi $sp, $sp, 20
    jr $31
    nop

