.text
.globl mein
###################################################################################
	.macro print_int (%x)
	li $v0, 1
	add $a0, $zero, %x
	syscall
	.end_macro
	
	print_int ($s0)
	print_int (10)
###################################################################################
	.macro print_str (%str)
	.data
	myLabel: .asciiz %str
	.text
	li $v0, 4
	la $a0, myLabel
	syscall
	.end_macro
	
	print_str ("test1")	#"test1" will be labeled with name "myLabel_M0"
	print_str ("test2")	#"test2" will be labeled with name "myLabel_M1"
###################################################################################
	# generic looping mechanism
	.macro for (%regIterator, %from, %to, %bodyMacroName)
	add %regIterator, $zero, %from
	Loop:
	%bodyMacroName ()
	add %regIterator, %regIterator, 1
	ble %regIterator, %to, Loop
	.end_macro
	
	#print an integer
	.macro body()
	print_int $t0
	print_str "\n"
	.end_macro
	
	#printing 1 to 10:
	for ($t0, 1, 10, body)
###################################################################################
	mein: