.data
	arr: .space 12
	newL: .asciiz " "
	
.text
	main:
	addi $s0, $0, 4
	addi $s1, $0, 10
	addi $s2, $0, 12
	
	#index = $t0
	addi $t0, $0, 0
	
	sw $s0, arr($t0)
		addi $t0, $t0, 4
	sw $s1, arr($t0)
		addi $t0, $t0, 4
	sw $s2, arr($t0)
	
	#clear $t0 t0 zero
	addi $t0, $0, 0
	while:	
		beq $t0, 12, exit
		
		lw $t6, arr($t0)
		
		addi $t0, $t0, 4
		
		#print current num
		li $v0, 1
		move $a0, $t6
		syscall
		
		li $v0, 4
		la $a0, newL
		syscall		
		
		j while
	exit:
	
		#end of program
		li $v0, 10
		syscall
	
