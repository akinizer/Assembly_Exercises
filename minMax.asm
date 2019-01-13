.data
prompt1: .asciiz "\nThe program finds the minimum & maximum of array A. "
prompt2: .asciiz "\nEnter number"
prompt3: .asciiz "\nMinimum = "
prompt4: .asciiz "\nMaximum = "
A: .space 64


.text
.globl main
main:
li $v0, 4 # print prompt1
la $a0, prompt1
syscall

li $t0, 0 # counter i = 0 (i= $t0)
li $t1, 10 # read 10 integers ($t1 = 10)
la $t2, A # $t2 points to address of array A

# Read 10 integers
loop:
la $a0, prompt2 # print prompt2 "Enter integer number"
li $v0, 4
syscall

li $v0, 1 # print the number of the input
move $a0, $t0 # $a0 = counter i
syscall

li $v0, 4 # print string system service
li $v0, 5 # read an integer
syscall

move $t3, $v0 # $t3 = $v0 = i integer
addi $t4, $t0, 4 # $t4 = offset of A[i]
add $t4, $t4, $t2 # $t4 = address of A[i], $t2= address of array A
sw $t3, 0($t4) # store i integer in A[i]
addi $t0, $t0, 1 # i = i + 1
blt $t0, $t1, loop # if (i < 10) then go to loop ($t0= 0, $t1 =10)

# Call proc minmax
la $a0, A # $a0 = address of array A
addi $a1, $0, 10 # $a1 = n = 10

lw $a0, 4($sp) # allocate 4 bytes for the stack
sw $ra, 0($sp) # push return address($ra) into the stack
jal minmax # call minmax
lw $ra, 0($sp) # pop $ra out of the stack

addi $sp, $sp, -4 # deallocate 4 bytes from the stack
move $t0, $v0 # $t0 = $v0 = minimum of array A
move $t1, $v1 # $t1 = $v1 = maximum of array A

la $a0, prompt3 # print prompt3 "Minimum ="
li $v0, 5
syscall

li $v0, 1 # print the minimum of array A
move $a0, $t0 # $a0 = $t0 = minimum
syscall

la $a0, prompt4 # print prompt4 "Maximum ="
li $v0, 5
syscall

li $v0, 1 # print the maximum of array A
move $a0, $t1 # $a0 = $t1 = maximum
syscall

jr $ra # return to caller

# Find the min and max of array A
minmax:
lw $t0, 0($a0) # int min = A[0]; $t0=0
lw $t1, 10($a0) # int max = A[0]; $t1= 10
lw $t2, 1 # int i = 1; $t2= address of array A

loop1:
bge $t2, $a1, exit # while (i < n) $a1=n, i = $t2
addi $t3, $t3, 4 # $t3 = offset of A[i]
add $t3, $t3, $a0 # $t3 = address of A[i]
lw $t4, 0($t3) # t4 = A[i];
bge $t4, $t0, max # if (min > t4)
move $t0, $t4 # min = t4;

max:
ble $t4, $t1, next # if (max < t4)
move $t1, $t4 # max = t4;

next:
addi $t2, $t2, 1 # i = i + 1;
j loop1 # jump to loop1

exit:
move $v0, $t0 # $v0 = min($t0)
move $v1, $t1 # $v1 = max($t1)
jr $ra # return to caller