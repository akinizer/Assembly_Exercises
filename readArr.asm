.data
	welcome: .asciiz "\nThis program is for array options\n-------------------------------------\n"	
	prompt: .asciiz "Enter integer (0 to break) :\n"
	prompt2: .asciiz "Enter size :\n"
	array: .space 100	
	text:   .asciiz "List: "
	space: .asciiz " "
.text
.globl monitor


# main function
monitor:
	
	# welcome message
	li $v0,4 
	la $a0, welcome
	
	
 	j arr	# jump array program
 	
 # create array
arr:
	# size intro
	li $v0, 4 
  	la $a0, prompt2
  	syscall
    
    	#read input   	
		
  	li $v0, 5
    	syscall 
    	
    	move $a0, $v0	
	
  	# array intro
	li $v0, 4 
  	la $a0, prompt
  	syscall
    
    	la $a1, array	
    	
    	
    	
# read inputs for the array	
read_array:

 	#read input   	
	move $a0, $v0	
  	li $v0, 5
    	syscall    	
			   
    	#store inputs to a1 array
	sw $v0, 0($a1)
    
   	# next index
    	addiu $a1, $a1, 4
    
    	# condition to jump to show list
    	beqz $v0, list
    	j read_array	# loop for inputs


# list of elements		
list:
    	la $a1, array

    	li $v0, 4
    	la $a0, text
    	syscall
 
while:
    	#t0 is current item for a1 array 
    	lw $t0, 0($a1) #copy current elet to t0
    	addiu $a1, $a1, 4	#cur = cur->next, current = current->next, size decreases by one

    	beqz $t0, done #if there is no item, t0 is 0 as default, jump to options
    
    	#print current t0
    	li $v0, 1
    	move $a0, $t0	#carry t0 value to a0
 
    	syscall

	 #string print
 	li $v0, 4
	la $a0, space 
	syscall	 
	
    	j while
done:
	li $v0, 10
	syscall	 

