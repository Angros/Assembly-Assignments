#################################################################################
# factorial.asm
# Computes the factorial of a non-negative integer
#
# Register use:
#	$t0 - number
#	$t1 - product
#	$t2 - counter
#################################################################################

	.text
	.globl main
	
main:
		li $t0, 5			# initialize number, product, counter
		li $t1, 1
		li $t2, 1
	
test_lp:	bgt $t2, $t0, end_lp 		# exit loop when counter > number
		mul $t1, $t1, $t2		# product <- product * counter
		add $t2, $t2, 1			# counter <- counter + 1
		
		b test_lp			# go back to loop test
		
end_lp:		nop				# do nothing, just end