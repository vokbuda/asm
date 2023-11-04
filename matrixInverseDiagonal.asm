.data
	matrix: .word 1,2,3,4,5
		.word 3,4,5,6,7
		.word 8,9,10,11,12
	length_row:.word 5
	length_column:.word 3



.text
	la $s0,matrix
	lw $t0,length_column
	lw $t1,length_row
	mul $s1,$t0,$t1
	add $s0,$s0,$s1#In $s0 we save some of our registers
	mul $t2,$t1,4
	subi $t2,$t2,4
	
	
forloop:
	