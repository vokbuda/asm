.data
	firstFloat:.float 4.51
	secondFloat:.float 5.13


.text
	l.s $f0,firstFloat
	l.s $f1,secondFloat
	div.s $f12, $f0,$f1
	li $v0,2
	syscall