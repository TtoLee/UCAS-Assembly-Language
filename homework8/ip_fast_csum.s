	.file	"ip_fast_csum.c"
	.text
	.globl	ip_fast_csum
	.type	ip_fast_csum, @function
ip_fast_csum:
.LFB0:
	.cfi_startproc
	movl	4(%esp), %edx
	movl	8(%esp), %ecx
#APP
# 10 "ip_fast_csum.c" 1
	  movl (%edx), %eax
  subl $4, %ecx
  jbe 2f
  addl 4(%edx), %eax
  adcl 8(%edx), %eax
  adcl 12(%edx), %eax
1: adcl 16(%edx), %eax
  lea 4(%edx), %edx
  decl %ecx
  jne	1b
  adcl $0, %eax
  movl %eax, %ecx
  shrl $16, %eax
  addw %cx, %ax
  adcl $0, %eax
  notl %eax
2:
# 0 "" 2
#NO_APP
	ret
	.cfi_endproc
.LFE0:
	.size	ip_fast_csum, .-ip_fast_csum
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
