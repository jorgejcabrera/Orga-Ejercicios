#include <mips/regdef.h>

.text
.ent pg_ascii2wchar_with_len
.globl pg_ascii2wchar_with_len

pg_ascii2wchar_with_len:
	subu	sp,sp,16
	sw	$fp,12($fp)
	sw	gp,8(sp)
	move	$fp,sp
	
	sw	a0,16($fp)
	sw	a1,20($fp)
	sw	a2,24($fp)

	move t0,zero
	sw t0,0($fp)				

	lw	t9,16($fp)
	lw	t8,20($fp)
	lw	t7,24($fp)

while_condition:
	ble	t7,zero,fin_while

	lb	t1,0(t9)
	beqz	t1,fin_while

	sw	t1,0(t8)
	addiu	t8,t8,4
	addiu	t9,t9,1
	subu	t7,t7,1
	lw	t1,0($fp)
	addi	t1,t1,1
	sw	t1,0($fp)
	
	b while_condition

fin_while:

	sw	zero,0(t8)
	
	lw	v0,0($fp)
	move	sp,$fp
	lw	gp,8(sp)
	lw	$fp,12(sp)
	addu	sp,sp,16
	jr	ra
	
	.end pg_ascii2wchar_with_len