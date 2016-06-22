#include <mips/regdef.h>

.text
.ent strrev
.globl strrev

strrev:
	subu	sp,sp,48
	sw		gp,32(sp)
	sw		$fp,36(sp)
	sw		ra,40(sp)
	move	$fp,sp
	sw		a0,48($fp)

	lw		t0,48($fp)
	sw		t0,16($fp)
	sw		t0,0($fp)
	jal		strlen
	subi	v0,v0,1
	addu	t0,t0,v0
	sw		t0,20($fp)

condicion_while:
	lw		t0,20($fp)
	lw		t1,16($fp)
	bge		t1,t0,fin_while
	lb		t2,0(t1)
	sb 		t2,24($fp)

	lb		t3,0(t0)
	sb 		t3,0(t1)

	lb		t4,24($fp)
	sb 		t4,0(t0)

	addi 	t1,t1,1
	sw 		t1,16($fp)

	addi	t0,t0,-1
	sw		t0,20($fp)

	b 		condicion_while

fin_while:
	lw		v0,48($fp)
	move	sp,$fp
	lw		ra,40(sp)
	lw		$fp,36(sp)
	lw		gp,32(sp)
	addu 	sp,sp,48
	jr		ra

	.end 	strrev

