.data 
	age: .word 23
.text
	li $v0, 1 #integer
	lw $a0, age
	syscall