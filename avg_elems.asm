############################################################
# avg_elems.asm
# This program calculates the average of the 5 
# elements in the array.
#
# Angel Rosario
# 841-12-7893
# 22-abril-2014
#
# Register use:
# $8   		Base register, address of array
# $9		Temporary address, average
# $10 - $14 	Array elements		
# $15		Temporary result			
############################################################

          .data
array:    .word 12
          .word 97
          .word 133
          .word 82
          .word 45
average:  .word 0

          .text
          .globl main
main:
	
	lui $8, 0x1001		# load base address into $8
	lw $10, 0($8)		# load 12 into $9

	addi $9, $8, 4		# base address + 4 
	lw $11, 0($9)		# load 97 into $11
	
	addi $9, $8, 8		# base address + 8
	lw $12, 0($9)		# load 133 into $13
	
	addi $9, $8, 12		# base address + 12
	lw $13, 0($9)		# load 82 into $15
	
	addi $9, $8, 16		# base address + 16
	lw $14, 0($9)		# load 45 into $17
	
	add $15, $10, $11	# compute 12 + 97
	add $15, $15, $12	# compute (12 + 97) + 133
	add $15, $15, $13	# compute (12 + 97 + 133) + 82
	add $15, $15, $14	# compute (12 + 97+ 133 + 82) + 45
	
	ori $16, $0, 5		# insert 5 into $15
	
	div $15, $16		# compute (12 + 97+ 133 + 82 + 45) / 5
	mflo $9			# put result in $9
	
	sw $9, 20($8)	        # store result in average
	
# End of Program
