	.text 
	.globl _start

_start:
	la $a0, str
	li $v0, 4
	syscall 
	
	li $v0, 10
	syscall  

	.data 
str: 	.asciiz "this is a test string\n"
n: 	.word  10