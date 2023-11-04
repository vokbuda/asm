.data


.text
	li $v0,6
	syscall
	mov.s $f2,$f0
	li $v0,6
	syscall
	mov.s $f3,$f0
	mul.s $f12,$f3,$f2
	li $v0,2
	syscall