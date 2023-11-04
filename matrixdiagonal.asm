.globl main
.data
	matrix: .word 3,2,1,4,18
		.word 10,23,6,40,11
		.word 2,5,7,9,87
		.word 4,5,8,12,32
	row_length:.word 5
	column_length:.word 4


.text
main:
	lw $t0,row_length
	lw $t1,column_length
	mul $t2,$t0,$t1
	mul $t2,$t2,4
	subi $t2,$t2,4
	move $a0,$t2
	li $v0,1
	syscall
	li $t4,0#index row
	li $t5,0#index column
	li $t6,0#current index
forloop:
	
	mul $t6,$t4,$t0
	mul $t6,$t6,4
	add $t6,$t5,$t6
	bge $t6,$t2,finish
	lw $t8,matrix($t6)
	move $a0, $t8
	li $v0,1
	syscall
	li $a0,0xA
	li $v0,0xB
	syscall
	addi $t5,$t5,4
	addi $t4,$t4,1
	j forloop
finish:
	li $v0,10
	syscall
	
	

	