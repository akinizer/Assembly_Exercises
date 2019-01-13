.data
array:  .space 100

prompt: .asciiz "Enter integer (0 to break) :\n"
text:   .asciiz "List:"
space: .asciiz " "
s: .asciiz "\nOpt(1,2,3,0)\n "
o1: .asciiz "\nopt1\n "
o2: .asciiz "\nopt2\n "
o3: .asciiz "\nopt3\n "
.text
    .globl main
main:

    li $v0, 4 
    la $a0, prompt
    syscall
    
    la $a1, array
	    
	
read_numbers:


    li $v0, 5
    syscall

    sw $v0, 0($a1)
    addiu $a1, $a1, 4

    beqz $v0, list
    j read_numbers

list:
    la $a1, array

    li $v0, 4
    la $a0, text
    syscall

while:
    lw $t0, 0($a1)
    addiu $a1, $a1, 4

    beqz $t0, if

    li $v0, 1
    move $a0, $t0
    syscall
	
 li $v0, 4 #string
	la $a0, space 
	syscall	 
    j while
  
    
if:
    li $v0, 4
    la $a0, s
    syscall
 	
	
	li $v0, 5
	syscall
	
	beqz $v0, end
	beq $v0, 1, a
	beq $v0, 2, b
	beq $v0, 3, c
	
	la $t0,s
	li $v0, 4
	syscall
	
	la $t1, s
	li $v0, 5
	syscall
	
	a:
		la $t0,o1
		li $v0, 4
		syscall
		
		
		
	b:
		la $t0,o2
		li $v0, 4
		syscall
		
	c:
		la $t0,o3
		li $v0, 4
		syscall
		
		
	end:



done:	
	li $v0, 10
	syscall	 
	

