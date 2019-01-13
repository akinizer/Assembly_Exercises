.data
	arr: .word 100:3 # 3 elements initialized to value 100
	newL: .asciiz " "
	
.text
	main:
 
	#clear $t0 t0 zero
	addi $t0, $0, 0
	while:	
		beq $t0, 12, exit # 3 x 4 = 12
		
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
	