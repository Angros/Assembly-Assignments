#################################################################################
# hello.asm
# Display a "hello worl" message
#
# Register use:
#	$v0 - system call code
#	$a0 - system call argument
#################################################################################

	.data
msg:	.asciiz "Hello, World!" 

	.text
	.globl main
	
main: 	li $v0, 4	# code to print string 
	la $a0, msg	# load string address
	syscall 	# excecute
	
	li $v0, 10	# code to exit program
	syscall		# excecute