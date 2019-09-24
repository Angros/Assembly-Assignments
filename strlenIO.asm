######################################################################
# strlenIO.asm
# Computes the length of the string entered by the user.
#
# Register useL
#	$t0 - counter
#	$t1 - pointer to current char
#	$t2 - current char
#	$v0 - system call code
#	$a0 - system call argument
######################################################################

	.data
prompt:	.asciiz "Enter a string: "
str:	.space 81
len_msg: .asciiz "The length of the string is: "

	.text
	.globl main
	
main:
		li $v0, 4		# print prompt
		la $a0, prompt
		syscall
		
		li $v0, 8		# read string	
		la $a0, str
		li $a1, 81
		syscall
	
		li $t0, 0		# initialize counter
		move $t1, $a0		# point to first char
	
next_char:	lb $t2, ($t1)		# get char

		beq $t2, $zero, end_lp	# exit loop when char == '\o'
		add $t0, $t0, 1		# counter <- counter + 1
		add $t1, $t1, 1		# point to next char
		b next_char		# get next char
		
end_lp:		sub $t0, $t0, 1		# discount 'enter'
		li $v0, 4		# print length message
		la $a0, len_msg
		syscall
		
		li $v0, 1		# print length
		move $a0, $t0		# move product to $a0
		syscall
		
exit: 		li $v0, 10		# exit program
		syscall