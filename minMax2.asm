.data
     promp_to_user: .asciiz "\nEnter number:\n"
     arr:          .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    # size:         .word 10
    # mx:           .word 0
    # mn:           .word 0
    #numturn:       .word 1
    prompt:        .asciiz "\nMax number is:"
      
.text
Main:
    add $t0, $zero, $zero     # $t0 = temp sum
    add $t2, $zero, $zero     # initailize loop counter $t2= i=0
    add $t3, $zero, $zero

    la $s0, arr               # address of arr stored in $s0

Loop:

  li $v0, 4                     #sys call code to print out string

  la $a0, promp_to_user         #address of the string to print
  syscall

   

  li $v0, 5                     # read integer

  syscall

  sw $v0, arr                # memory

   

  li $v0, 4                    # print string

  la $a0, prompt               # Max number is:

  syscall

   

  li $v0, 1                    # print integer

  lw $a0, arr

  syscall

  

  #addi $s0, $s0, 4

  addi $t2, $t2, 1              #i++

  ble $t2, 9, Loop

  

  li $v0, 10                   #sys code stop

  syscall
