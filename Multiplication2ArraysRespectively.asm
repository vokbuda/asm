.data
	vector1:.word 25,34,12,4,7,90
	vector2:.word 2,1,5,8,2,3
	lengthvectors:.word 6
	resultvector:.space 24


.text
	lw $t1,lengthvectors#load length of vector in mips
	li $t0,0
	mul $t1,$t1,4
forloopiteration:
	lw $t2,vector1($t0)#value of the first vector
	lw $t3,vector2($t0)#value of the second vector
	mul $t4,$t3,$t2
	sw $t4,resultvector($t0)
	addi $t0,$t0,4
	bne $t0,$t1,forloopiteration
	li $t0,0
verifyForloopIteration:
	lw $t2,resultvector($t0)
	move $a0,$t2
	li $v0,1
	syscall
	addi $t0,$t0,4
	bne $t0,$t1 verifyForloopIteration
	li $v0,10
	syscall
	
	


