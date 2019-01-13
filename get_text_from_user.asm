.data
	mess: .asciiz "hello, "
	input: .space 20
.text
	main:
		#get input as text
		li $v0, 8 #text
		la $a0, input
		li $a1, 20 #length of text
		syscall
		
		#display mess	
		li $v0,4 
		la $a0, mess
		syscall
		
		#display name	
		li $v0,4 
		la $a0, input
		syscall
		
		#end of program
		li $v0, 10
		syscall
		