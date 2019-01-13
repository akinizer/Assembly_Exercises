#Steven McConnon
#Bubble Sort - coded from scratch

.data
 
#below here we initialize our variables
intro_string: 
	.asciiz "\n\nThe input string is: " 
 
exit_string: 
	.asciiz "\nThe output string is: " 
 
question_string: 
	.asciiz "Please enter your string. It must be exactly 10 characters long.\n" 	
 
input_string:
	.space 11 ##
 
 
 
.text
 
main: 
	#this block prints the question string
	la $a0, question_string
	li $v0, 4 		
	syscall
 
	#this block saves the string to the space
	la $a0, input_string	
	li $a1, 11##
	li $v0, 8
	syscall
 
	## this block prints the intro_string
	la $a0, intro_string
	li $v0, 4
	syscall
 
	## this block prints the ztring they entered
	la $a0, input_string
	li $v0, 4
	syscall
 
 
 
	li $t0, 10  ## 					#t0 = numChars 
	li $t1, 0					#t1 = i = 0
	li $t2, 0					#t2 = j = 0
	la $t3, input_string				#tr = input string

 
	jal toUpper_loop				#runs toUpper on the string
	 
	j bubble_sort_outer				#start the bubble sort loops
	
 
 
 
 
 
 
bubble_sort_outer: 	
	beq $t1, $t0, exit_program			# if( t1 == 10) jump to exit
	
	li $t2, 0					#t2 = j = 0
	j bubble_sort_inner				#run to the inner loop
	
bubble_sort_outer_exit: 	
	addi $t1, $t1, 1				# i++
	j bubble_sort_outer				#jump back to top of loop
	
 
bubble_sort_inner:		
	addi $t4, $t2, 1				#t4 == ( j + 1 )
	beq $t4, $t0, bubble_sort_inner_return		#if( (J+1) == 10 ) jump to return address
	
 
	add $t5, $t3, $t2				#t5 = &string[ j ] 	
	add $t6, $t3, $t4				#t6 = &string[ j + 1 ]
	
	lb $t7, 0($t5)					#t7 = string[ j ]
	lb $t8, 0($t6)		 			#t8 = string[ j + 1 ]
	
	bgt  $t8, $t7, bubble_sort_inner_continue	#if ( string[ j ] <= string[ j + 1 ] ) jump past to rest of loop
	
 
	sb $t7, 0($t6)					# swap string[ j + 1 ] with string[ j ]
	sb $t8, 0($t5)					# swap string[ j ] with string[ j + 1 ]
	
	j bubble_sort_inner_continue			#jump to rest of loop
	
 
bubble_sort_inner_continue:
	addi $t2, $t2, 1				# j++
	j bubble_sort_inner				# jump back to the top of the loop
	
 
bubble_sort_inner_return:
	j bubble_sort_outer_exit			#jumps back up to where the bubble sort was
	
 
toUpper_loop:
	beq $t2, $t0, toUpper_return			# if( j == 10 ) then return
	add $t5, $t3, $t2				#t5 = &string[ j ] 	
	lb $t7, 0($t5)					#t7 = string[ j ]
	
	bgt $t7, 122, toUpper_continue			#this is not lowercase, jump to the continue
	blt $t7, 97, toUpper_continue			#this is also not lowecase, jump to the continue
	
	subi $t7, $t7, 32				#subtract 32 to make it uppercase 
	sb $t7, 0($t5)					#store it back into the string.
	
	j toUpper_continue				#continue on with the rest of the loop!
	
 
toUpper_continue:
	addi $t2, $t2, 1				#j++
	j toUpper_loop
 
toUpper_return:
	jr $ra
 
exit_program:	
	## this block prints the exit_string
	la $a0, exit_string
	li $v0, 4
	syscall
 
	#this block prints the sorted string
	la $a0, 0($t3)
	li $v0, 4 		
	syscall
 
 
 
 
 
	#this block just quits the program gracefully when it's done
	li $v0, 10		
	syscall
