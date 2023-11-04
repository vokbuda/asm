.globl main
.data
.text
main:
	li $v0, 5
    	syscall
    	move $t1,$v0
    mul $t1,$t1,4
    move $a0,$v0
    li $v0, 9
	syscall
	move $t0,$v0
	move $t4,$t0
	add $t1,$t1,$t0
	j first_iteration
first_iteration:
	bge $t0,$t1,final_loller
	li $v0, 5
    syscall
	sw $v0,($t0)
	add $t3,$t3,$v0
	addi $t0,$t0,4
	beqz $t6,modification_value1
	bgt $v0,$t6,maxvalue
	bgt $t7,$v0,minvalue
	j first_iteration
modification_value1:
	move $t6,$v0
	move $t7,$v0
	j first_iteration
maxvalue:
	move $t6,$v0
	j first_iteration
minvalue:
	move $t7,$v0
	j first_iteration	
final_loller:
	move $t8, $t3
	move $t9, $t3
	li $v0,1
	move $a0, $t3
	syscall
	move $t1,$t4
	li $a0,0xA
	li $v0,0xB
	syscall
	subi $t0,$t0,4
	j final_iteration
minvaluelast:
	move $t9,$t3
	bgt $s0,$t6,maxvalue2
	bgt $t7,$s0,minvalue2
	bge $t4,$t0,lastIf
	addi $t4,$t4,4
	j final_iteration
maxvaluelast:
	move $t8,$t3
	bgt $s0,$t6,maxvalue2
	
	bgt $t7,$s0,minvalue2
	bge $t4,$t0,lastIf
	addi $t4,$t4,4
	j final_iteration
maxvalue2:
	move $t6,$s0
	bge $t4,$t0,lastIf
	addi $t4,$t4,4
	j final_iteration
minvalue2:
	move $t7,$s0
	bge $t4,$t0,lastIf
	addi $t4,$t4,4
	j final_iteration
final_iteration:
	li $v0, 5
    syscall
    beqz $v0,finishgang	
    lw $t5,($t4)
    sub $t3,$t3,$t5
    add $t3,$t3,$v0
    move $s0,$v0
	move $a0,$t3
	li $v0,1
	syscall
	li $a0,0xA
	li $v0,0xB
	syscall
	sw $s0,($t4)
	bgt $t3,$t8,maxvaluelast
	bgt $t9,$t3,minvaluelast
	bgt $s0,$t6,maxvalue2
	bgt $t7,$s0,minvalue2
	bge $t4,$t0,lastIf
	addi $t4,$t4,4
    j final_iteration
lastIf:
	move $t4,$t1
	j final_iteration
finishgang:
	li $v0,1
	move $a0,$t7
	syscall
	li $a0, 0xA
	li $v0, 0xB
	syscall
	li $v0,1
	move $a0,$t6
	syscall
	li $a0, 0xA
	li $v0, 0xB
	syscall
	li $v0,1
	move $a0,$t9
	syscall
	li $a0, 0xA
	li $v0, 0xB
	syscall
	li $v0,1
	move $a0,$t8
	syscall
	li $a0, 0xA
	li $v0, 0xB
	syscall
	li $v0,10
	syscall