#################################################################################
# factorialIO.asm
# Computes the factorial of a non-negative integer
# NOTE: This version uses system calls for IO.
# Register use:
#	$t0 - number
#	$t1 - product
#	$t2 - counter
#	$v0 - system call code
#	$a0 - system call argument
#################################################################################

	  .data
prompt:   .asciiz "Enter a non-negative integer: "
fact_msg: .asciiz "The factorial is "
err_msg:  .asciiz "Error! Negative number."

	  .text
	  .globl main
	
main:
		li $v0, 4			# print prompt
		la $a0, prompt
		syscall
		
		li $v0, 5			# read integer, put it in $v0
		syscall
		
		
		move $t0, $v0			# initialize number, product, counter
		li $t1, 1
		li $t2, 1
		
test_lp:	bgt $t2, $t0, end_lp 		# exit loop when counter > number
		mul $t1, $t1, $t2		# product <- product * counter
		add $t2, $t2, 1			# counter <- counter + 1
		
		b test_lp			# go back to loop test
		
end_lp:		li $v0, 4			# print factorial message
		la $a0, fact_msg
		syscall
		
		li $v0, 1			# print factorial
		move $a0, $t1			# move product to $a0
		syscall
		
		b exit
		
err:		li $v0, 4			# print error message
		la $a0, err_msg
		syscall
		
exit:           li $v0, 10			# exit program
		syscall