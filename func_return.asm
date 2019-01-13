.data 
	
.text
	main:
		addi $a1, $zero, 50
		addi $a2, $zero, 100
		
		jal addNum
		
		li $v0, 1
		addi $a0, $v1, 0
		syscall
		
		#program is done
		li $v0, 10
		syscall
	
	addNum:
		add $v1, $a1, $a2				
		jr $ra #go back to main wwhen dispMess done
		