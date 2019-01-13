.data
	prompt: .asciiz "Enter age:"
	mess: .asciiz "\n Display age:"
.text
	#prompt(ask) user to enter age 
	li $v0,4 
	la $a0, prompt
	syscall
	
	#get user age
	li $v0,5 #cin>> 
	syscall
	
	#store age in $t0
	move $t0, $v0
	
	#display message
	li $v0,4 
	la $a0, mess
	syscall
	
	#print age
	li $v0,1
	move $a0, $t0
	syscall