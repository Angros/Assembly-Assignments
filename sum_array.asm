################################################
# sum_array.asm
# Sums the elements in an integer array
#
# Register use:
#  $8 -- count
#  $9 -- pointer to the array entry
# $10 -- current array entry
# $11 -- sum of all integers
# $12 -- sum of negative integers
# $13 -- sum of positive integers
# $15 -- SIZE of the array
# $16 -- Scratch
################################################

	.data
length:	.word 5
array:	.word 15, 26, -14, -7, 8   # = 28

 	.text
	.globl main
	
main:
	ori $8, $0, 0		# initialize counter to 0
	
	ori $11, $0, 0		# initialize sum to 0
	ori $12, $0, 0		# initialize sum of negatives to 0
	ori $13, $0, 0		# initialize sum of positiives to 0
	
	lui $9, 0x1001		# get address of 'length'
	lw $15, 0($9)		# get array SIZE
	
test:   sltu $16, $8, $15	# check if counter < SIZE
	beq $16, $0, endLp	# exit loop if counter >= SIZE
	sll $0, $0, 0
	
	addi $9, $9, 4		# point to next element
	lw $10, 0($9)		# get next element
	
	add $11, $11, $10	# sum <- sum + element
	
	slt $16, $10, $0	# check if element < 0
	beq $16, $0, pos	# jump to 'pos' if element >-= 0
	sll $0, $0, 0
	
	add $12, $12, $10	# sum of neg <- sum of neg + element
	j endIf			# jump to 'endIf'
	sll $0, $0, 0
	
pos:	add $13, $13, $10	# sum of pos <- sum of pos + element
	
endIf:	addi $8, $8, 1		# counter <- counter + 1
	
	j test			# go back to test
	sll $0, $0, 0
	
endLp:	sll $0, $0, 0
