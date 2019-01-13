.data
.text
.globl main
main:
					li $a0, 80
      		  			li $v0, 9
        				syscall	# Get memory
        				
        				

					move $a0, $v0
        				li $a1, 80
        				li $v0, 8
        				syscall	# Read String
        				
        				beqz $v0, done
        				
        				li $v0, 4
        				syscall	# Print String	
        				
        				j main
        				done:
        				
        					
        					li $v0, 10
        					syscall	# Print String	