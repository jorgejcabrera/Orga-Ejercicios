#include <mips/regdef.h>

.text
.ent my_strlen_utf8_c
.globl my_strlen_utf8_c

my_strlen_utf8_c:
	subu	sp,sp,16
	sw	gp,8(sp)
	sw	$fp,12(sp)
	move	$fp,sp

	sw	a0,16($fp)
	move 	t0,zero
	move	t1,zero
	sw	t0,0($fp)			
	sw	t1,4($fp)			

condicion_while:
	lw	t2,16($fp)			
	lw	t0,4($fp)			
	add 	t2,t2,t0			
	lb	t3,0(t2)			
	beqz	t3,fin_while


	andi	t4,t3,0xc0			
	li	t5, 0x80			
	beq 	t4,t5,fin_if
	lw	t0,0($fp)			
	addi	t0,t0,1 			
	sw 	t0,0($fp)

fin_if:
	lw	t0,4($fp) 			
	addi 	t0,t0,1 			
	sw 	t0,4($fp)
	b 	condicion_while

fin_while:
	lw	v0,4($fp)
	move 	sp,$fp
	lw	$fp,12(sp)
	lw 	gp,8(sp)
	addu 	sp,sp,16
	jr	ra

	.end 	my_strlen_utf8_c
