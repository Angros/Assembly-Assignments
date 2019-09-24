############################################################
# avg_elems2.asm
# This program calculates the average of the 5 
# elements in the array using a cycle.
#
# Angel Rosario
# 841-12-7893
# 7-mayo-2014
#
#
# Register use:
# $8 -- counter
# $9 -- pointer to array entry
# $10 -- size
# $11 - array elements
# $12 - temporary
# $13 - current element
# $14 - Scratch
############################################################
          .data
size:     .word 5
array:    .word 12, 97, 133, 82, 45
average:  .word 0

	  .text
	  .globl main
	  
main:
	ori $8, $0, 0		# initialize counter
	
	lui $9, 0x1001		# address of 'size'
	lw $10, 0($9)		# get array size
	
	
loop:	sltu $13, $8, $10	# if counter < size
	beq $13, $0, endLoop	# exit loop if counter >= size
	sll  $0, $0, 0
	
	addi $9, $9, 4		# point to next element
	lw $13, 0($9)		# get next element
	
	add $12, $12, $13	# sum <- sum + elem
	addi $8, $8, 1		# count + 1 -> count
	j loop			# return to loop
	sll $0, $0, 0

endLoop: divu $12, $10		# sum array elem / size
	 mflo $12
	 
	 sw $12, 4($9)		# store result in average
	 sll $0, $0, 0

# End of program
