#include <mips/regdef.h>
.text
.ent strnlen
.globl strnlen

strnlen:
	subu	sp,sp,16
	sw	gp,8(sp)
	sw	$fp,12(sp)
	move	$fp,sp
	sw	a0,16($fp)
	sw	a1,20($fp)
	move	t0,zero
	sw	t0,0($fp)

condicion_for:
	lw	t0,0($fp)
	lw	t1,20($fp)
	bge t0,t1,fin_for
	lw	t2,16($fp)
	lb	t2,0(t2)
	beqz	t2,fin_for
	addi	t0,t0,1
	sw	t0,0($fp)
	lw 	t2,16($fp)
	addi	t2,t2,1
	sw	t2,16($fp)
	b 	condicion_for

fin_for:
	lw	v0,0($fp)
	move	sp,$fp
	lw	gp,8(sp)
	lw	$fp,12(sp)
	addu	sp,sp,16
	j	ra
	.end	strnlen


