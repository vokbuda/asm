.globl main
.data
	vector:.word 2,3,15,65,98,23,43,44,11,81
	length_vector:.word 10

.text
main:
	li $v0,5
	syscall
	move $t4,$v0
	li $t0,0#inizializzazione di un contatore
	lw $t1,length_vector#setup di lunghezza del vettore
	mul $t1,$t1,4
	
	
forlooper:
	lw $t3,vector($t0)
	sub $t3,$t3,$t4
	sw $t3,vector($t0)
	addi $t0,$t0,4
	bne $t1,$t0,forlooper
	li $t0,0
printArray:
	lw $t3,vector($t0)
	move $a0,$t3
	li $v0,1
	syscall
	addi $t0,$t0,4
	bne $t1,$t0,printArray
	li $v0,10
	syscall
		
