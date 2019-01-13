 .data
 message1: .asciiz "Enter 1:"
 message2: .asciiz "Enter 2: "
   .text
  main:
  li $v0, 4
la $a0, message1    # prints the first message 
syscall

li $v0, 5       # reads the size for the array      
syscall

mul $t0, $v0, 4     # because array contains integer, I change them into bytes
move $a0, $t0     # allocate the size of the array in the heap
li $v0, 9       # now, $v0 has the address of allocated memory
syscall

move $v1, $v0       # Because systemcall uses $vo register, I move it to $v1 keep it safe.

create_array:   

	la $a0, message2    # prints the first message
	li $v0, 4 
	syscall

	li   $s0, 0         # $s1 is the index, and loop induction variable
    	li   $s1, 5         # $s1 is the sentinel value for the loop

Loop1:  
	bge  $s0, $s1, End_Loop1

	li $v0, 5           # Read integer values
	syscall

    	mul  $t3, $s0, 4        # $t3 is the offset
    	add  $t4, $t3, $t0      # $t4 is the address of desired index
    	sw   $v0, ($t4)         # store the value in the array
	addi $s0, $s0, 1        # increment the index        
    	j    Loop1

End_Loop1: