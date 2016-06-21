#include <mips/regdef.h>

# 16			char* s
# -----------------------------
# 12			fp				SRA
# 8				gp
# -----------------------------
# 4				i 				LTA
# 0				j
# -----------------------------

#int my_strlen_utf8_c(char *s){
#	int i = 0, j = 0;
#	while (s[i]) {
#		if ((s[i] & 0xc0) != 0x80) j++;
#		i++;
#	}
#	return j;
#}

.text
.ent my_strlen_utf8_c
.globl my_strlen_utf8_c

my_strlen_utf8_c:
	#creo el stack
	subu	sp,sp,16
	sw		gp,8(sp)
	sw		$fp,12(sp)
	move	$fp,sp

	sw		a0,16($fp)
	move 	t0,zero
	move	t1,zero
	sw		t0,0($fp)			# i=0
	sw		t1,4($fp)			# j=0

condicion_while:
	lw		t2,16($fp)			# t1=*s
	lw		t0,4($fp)			# t2=i
	add 	t2,t2,t0			# t2=&s[i]
	lb		t3,0(t2)			# t3=s[i]
	beqz	t3,fin_while

	#(s[i] & 0xc0) != 0x80
	andi	t4,t3,0xc0			#s[i] & 0xc0
	li		t5, 0x80			#t5=0x80
	beq 	t4,t5,fin_if
	lw		t0,0($fp)			#t0=j
	addi	t0,t0,1 			#t0++
	sw 		t0,0($fp)

fin_if:
	lw		t0,4($fp) 			#t0=i
	addi 	t0,t0,1 			#t0=i++
	sw 		t0,4($fp)
	b 		condicion_while

fin_while:
	lw		v0,4($fp)
	move 	sp,$fp
	lw		$fp,12(sp)
	lw 		gp,8(sp)
	addu 	sp,sp,16
	jr		ra

	.end 	my_strlen_utf8_c