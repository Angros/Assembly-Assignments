################################################
# sumArray.asm
# Computes the sums of the positive and negative elements in an 
# array of integers.
#
# Register use:
# $t0 - counter
# $t1 - sum of postive elements
# $t2 - sum of negative elements
# $t3 - array length
# $t4 - pointer to current element
# $t5 - current element
# $v0 - system call code
# $a0 - system call argument
################################################

		.data
len:		.word 5
arr:		.word 2, -14, 1, -6, 15
pos_msg:	.asciiz "The sum of the positive elements is "
neg_msg:	.asciiz "\nThe sum of the negative elements is "
	
		.text
		.globl main
main:
		li $t0, 0		# initialize counter, positive and negative
		li $t1, 0
		li $t2, 0
		
		lw $t3, len		# load array length
		la $t4, arr		# point to first element
		
test_lp:	beq $t0, $t3, end_lp 	# exit loop when counter == length
		lw $t5, ($t4)		# get element
		
		blt $t5, $zero, neg_el	# go to neg_el if element < 0
		
		add $t1, $t1, $t5	# positive <- positive + element
		b end_if		# go to end_if
		
neg_el:		add $t2, $t2, $t5	# negative <- negative + element

end_if:		add $t4, $t4, 4		# point to next element
		add $t0, $t0, 1		# counter <- counter + 1
		b test_lp
		
end_lp:		li $v0, 4		# print positives message
		la $a0, pos_msg		
		syscall
		
		li $v0, 1		# print sum of positives
		move $a0, $t1
		syscall
		
		li $v0, 4		# print negative message
		la $a0, neg_msg
		syscall
		
		li $v0, 1		# print sum of positives
		move $a0, $t2
		syscall
		
exit:		li $v0, 10		# exit program
		syscall