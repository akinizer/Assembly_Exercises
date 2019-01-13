.data 
	newLine: .asciiz "\n"
.text
	main:
		addi $s0, $zero, 10
		#print value
		li $v0, 1
		move $a0, $s0
		syscall
	
		#program is done
		li $v0, 10
		syscall
	incReg:
		addi $sp, $sp, -4