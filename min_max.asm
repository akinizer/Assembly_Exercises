.data
	res: .asciiz " "
.text
.globl minMax
minMax:
	
	li $s6, 5
	li $s7, 100
	
	move $a0, $v0
	
	li $v0, 5	
	syscall
		
	if: 
		bgt $v0, $s6, 
	
	move $s6, $v0
	jal minJ
	
	iff: 	blt $v0, $s6, imm
	move $s7, $v0

	move $a0, $s6
	li $v0, 1			# print min
	syscall
	
	
	
	
	#jal maxJ
	
	#jal printMinMax
	
	j done
sgtt:

sltt:
	


printMinMax:
	move $a0, $s6
	li $v0, 1			# print min
	syscall
	
	li $v0, 4			 
	la $a0, res
	syscall
	
	move $a0, $s7
	li $v0, 1			# print max
	syscall
	
	jr $ra
done:
	
	li $v0, 10			# endprogram
	syscall
