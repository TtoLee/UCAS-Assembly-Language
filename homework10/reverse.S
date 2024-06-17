.section .data
.section .text

.globl reverse
.type reverse, @function
reverse:
    addi $sp, $sp, -20
    addi $t0, $sp, 0
    sw $ra, 16($sp)
    sw $a0, 12($sp)
    sw $a1, 8($sp)
    
    addi $t1, $a1, -1   //length - 1
    addi $t2, $a0, 0    //p = a
    li $t3, 4
    mult $t1, $t3       //q = a + length - 1
    mflo $t3
    add $t3, $a0, $t3
    divu $t1, 2
    mflo $t1            //m = (length - 1) / 2
    li $t4, 0           //i
    bgt $t4, $t1, L2
    nop

L1: 
    lw $t5, 0($t2)      //temp = *p
    lw $t6, 0($t3)      //*p = *q
    sw $t6, 0($t2)
    sw $t5, 0($t3)      //*q = temp
    addi $t2, $t2, 4    //p++
    addi $t3, $t3, -4   //q--
    addi $t4, $t4, 1    //i++
    ble $t4, $t1, L1
    nop

L2: 
    addi $sp, $sp, 20
    jr $31
    nop