.data
	res: .asciiz "well done"
	res2: .asciiz "broke"
.text
.globl minMax
minMax:
	
	la $s0, 5
	la $s1, 6
	ble $s0, $s1, done
	
	
done:
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 10
	syscall
done2:
	li $v0, 4
	la $a0, res
	syscall
	
	

