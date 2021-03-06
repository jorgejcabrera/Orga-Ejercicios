#include <mips/regdef.h>

.text
.ent diag
.globl diag

diag:
	subu 	sp,sp,16
	sw	$fp,12(sp)
	sw	gp,8(sp)
	move	$fp,sp

	sw	a0,16($fp)
	sw	a1,20($fp)

	move	t0,zero			#t0 = i
	sw	t0,0($fp)
	move	t1,zero	
	addi	t1,t1,1
	sw	t1,4($fp)		#t1 = acum

	lw	t2,16($fp)		#t2 = &a
	lw	t3,20($fp)		#t3 = n
	lw	t4,0(t2)		#t4 = *a

for:
	bge	t0,t3,fin_for
	lw	t1,4(4fp)		#t1 = acum
	
	#acum *= *(a+i+i*n)
	mulo	t5,t0,t3		#t5 = i * n
	addu	t5,t5,t0		#t5 = i + i * n
	addu	t5,t5,t4		#t5 = *a + i + i * n
	mulo	t5,t5,t1		#t5 = acum * *(a + i + i * n)
	sw	t5,4($fp)
	addi	t0,t0,1
	b for

fin_for:
	lw	v0,4($fp)
	move	sp,$fp
	lw	gp,8(sp)
	lw	$fp,12(sp)
	addu	sp,sp,16
	jr	ra

	.end diag
