.data
	arr: .space 12
	space: .asciiz " "
	
.text
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
		
	lw $t6, arr($0)
	
	li $v0, 1
	addi $a0, $t6, 0
	syscall
	
	
		
				
		#end of program
		li $v0, 10
		syscall
	
	printNum:
		li $v0, 1
		add $a0, $t0, $0
		syscall
		
		li $v0, 4
		la $a0, space
		syscall
		
		jr $ra
