##########################################################
# absVal.asm
# This program computes the absolute value of variable A.
# Register use:
#	$10	base address of data segment
#	$8	contents of variable A
##########################################################

A:	.data
	.word -56
	
	.text
	.globl main
main:
# Get the value of A
	lui $10, 0x1001		# Load base address
	lw $8, 0($10)		# Load contents of A
	sll $0, $0, 0		# No-Op

# Is it a negative
	srl $9, $8, 31		# Put sign bit in reg. $9
	beq $9, $0, done	# Go to done if 0 (non-negative)
	sll $0, $0, 0
	
# Store if $ is negative
	sub $8, $0, $8		# Negative value
	sw $8, 0, ($10)
	
done:	sll $0, $0, 0