
.data

prompt:      .asciiz "\nPlease enter a number: "
arr1:            .word 0, 0, 0

.text

main:

la $s0, arr1 # will load the address of your array into $s0
li $s1, 3 # Load 3 into $s1

loop: # Loop for 3 times getting input and storing it into array
beq $s1, $0, next

li $v0, 4
la $a0, prompt #Prompt for value
syscall

li $v0, 5 # Get value
syscall

sw $v0, 0($s0) # Store user input into offset 0-2 arr[0], arr[1], arr[2]

addi $s0, $s0, 4 # increment array pointer by 4 (since we used .word array) takes up 4 bytes of space in memory
sub $s1, $s1, 1 # decrement loop argument by 1 (for 3 values to be entered)

j loop # jump back to loop

next:
la $s0, arr1 # Reset array pointer to beginning position
# To grab the median from the array we can do it one of two ways.
# We can either offset the lw command by 1 or we can increment the pointer by 4
# We offset since it takes less lines of code.

lw $t0, 1($s0) # Here we load word into $t0 offset 1

li $v0, 1
add $a0, $t0, $0 # Will display the median to screen
syscall

endprogram:

li $v0, 10
syscall
