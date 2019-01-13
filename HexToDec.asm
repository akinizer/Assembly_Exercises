.data
	.
	
	
	ask: .asciiz "\nEnter integer: "
	res: .asciiz "\nResult: "
	
.text
.globl main

main:	
	
	li $s1,1 #multiplier
	li $s2,0 #number
	
	la      $a0,ask               # address of string to print
    	li      $v0,4                   # syscall for print string
        syscall
        
    	li      $v0,5                   # read
    	syscall
    	
    	move $a0, $v0 #1117
   	
   	j for
 for:
 	beqz $a0, endfor    	
    	
    	div $a0, $a0, 10
    	mflo $t1 #quotent 111
    	mfhi $t2 #remainder 7
    	
    	mul $t2, $t2, $s1
    	
    	add $s2, $s2, $t2  #curent number    	
    	
    	mul $s1, $s1, 8 

    	j for    	
endfor:
    	move $a0, $s2
	li      $v0,1                   # read
    	syscall
	
	
	li $v0, 10
	syscall

