.data
	mess: .asciiz "hello, what s up?"
	
.text
	main:
		addi $s0, $zero, 14
		addi $s0, $zero, 10
		
		bgt $s0, $s1, dispHi
		#blt $s0, $s1, dispHi
		#beq $s0, $0, dispHi
				
		#end of program
		li $v0, 10
		syscall
	
	dispHi:
		li $v0, 4
		la $a0, mess
		syscall