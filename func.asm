.data 
	mess: .asciiz "hello\n"
.text
	main:
		jal dispMess
		
		addi $s0, $zero, 5
		
		#print 5 to screen
		li $v0, 1
		add $a0, $zero, $s0
		syscall
	
		#program is done
		li $v0, 10
		syscall
	
	dispMess:
		li $v0, 4
		la $a0, mess
		syscall
		
		jr $ra #go back to main wwhen dispMess done
		