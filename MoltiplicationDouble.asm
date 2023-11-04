.data
	firstDouble:.double 3.54
	secondDouble:.double 5.48


.text
	li $v0,7
	syscall
	mov.d $f4,$f0
	li $v0,7
	syscall
	mov.d $f6,$f0
	mul.d $f12,$f6,$f4
	li $v0,3
	syscall
