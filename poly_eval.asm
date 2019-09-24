#################################################
# poly_eval.asm
# This program evaluates 6x^3 – 3x^2 + 7x + 2
# This program uses the Horner's Method
#
# Angel Rosario
# 841-12-7893
# 22-abril-2014
#
# Register use:
# $8  Accumulator; Value of poly		
# $9  Base register, address of x					
# $10  Value of x					
# $11  Temporary
#################################################
	
          .data
x:        .word 1 # -1
poly:     .word 0

          .text
          .globl main
main:

	ori $8, $0, 6		# initialize accumulator
	
	lui $9, 0x1001		# load base address into $9
	lw $10, 0($9)		# load value of x into $10
	
	mult $8, $10		# compute 6 * x
	mflo $8			# put 6 * x in $8
	
	ori $11, $0, 3		# insert 3 in temp register
	subu $8, $8, $11	# comute 6x - 3
	
	mult $8, $10		# compute 6x^2 - 3x
	mflo $8			# put 6x^2 - 3x in $8
	
	ori $11, $0, 7		# insert 7 in temp register
	add $8, $8, $11		# compute 6x^2 - 3 + 7
	
	mult $8, $10		# compute 6x^3 - 3x^2 + 7x
	mflo $8			# put 6x^3 - 3x^2 + 7x in $8
	
	ori $11, $0, 2		# insert 2 in temp register
	add $8, $8, $11		# compute 6x^3 - 3x^2 + 7x + 2
	
	sw $8, 4($9)	        # store result in poly
	
# End of Program
