.data 
	char: .byte 'm'
.text
	li $v0, 4 #char
	la $a0, char
	syscall