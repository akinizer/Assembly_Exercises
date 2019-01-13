.data
space: .asciiz " "
array:	
	.word 12, 34, 67, 1, 45, 90, 11, 33, 67, 19
msg_done: 
	.asciiz "bubble sort done\n"
	
	
	.text
	.globl main
main:
	la $s7, array
	li $s0, 0 #i
	li $s6, 9 #N-1
	li $s1, 0 #j
loop:
	sll $t7, $s1, 2
	add $t7, $s7, $t7 # got the address of A[j]
	lw $t0, 0($t7)  #$t0 is A[j]	
	lw $t1, 4($t7)  #$t1 is A[j+1]	
	sub $t2, $t0, $t1
	bgtz $t2, noordoneswap
	sw $t1, 0($t7)  #$t0 is A[j]	
	sw $t0, 4($t7)  #$t0 is A[j+1]	
noordoneswap:	
	addi $s1, $s1, 1
	sub $s5, $s6, $s0 #$s3 is N-i-1
	bne  $s1, $s5, loop
	addi $s0, $s0, 1 
	li $s1, 0 #j
	bne  $s0, $s6, loop
	
while:
	move $a1, $s7
    lw $t0, 0($a1)
    addiu $a1, $a1, 4

    beqz $t0, done

    li $v0, 1
    move $a0, $t0
    syscall
	
 li $v0, 4 #string
	la $a0, space 
	syscall	 
    j while

done:	
	li $v0,4
	la $a0,msg_done
	syscall
	
	jal while
	
	
	li $v0,10
	syscall