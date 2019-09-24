################################################
# loop_product.asm
# Calcuates the product fo the numbers 1 - 10
#
# Angel Rosario
# 841-12-7893
# 7-mayo-2014
#
#
# Register use:
# $8 -- counter
# $9 -- product of elements
# $10 - pointer to the array entry
# $11 - current array entry
# $12 - Array Size
# $13 - Scratch
# $14 - current array entry
################################################

	.data
length:	.word 10
array:	.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
result: .word 0
	
	.text
	.globl main
	
main:
	ori $8, $0, 0		# initialize counter
	ori $9, $0, 1		# initialize product to 1
	
	lui $10, 0x1001		# address of 'length' 
	lw $12, 0($10)		# get array size
	
loop:	sltu $13, $8, $12	# if counter < size
	beq $13, $0, endLoop	# exit loop if counter >= size
	sll $0, $0, 0		
	
	addi $10, $10, 4	# point to next element
	lw $14, 0($10)		# get next element
	
	mult $9, $14		# product <- product * element
	mflo $9			# insert product to $9
	
	addi $8, $8, 1		# count + 1 -> counter
	j loop			# return to the loop
	sll $0, $0, 0
	
endLoop: sw $9, 4($10)		# store product in result
	 sll $0, $0, 0
	
# End of Program
