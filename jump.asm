#######################################################
# jump.asm
# This program demostrates the function of j, benq, bne
#
#######################################################
	.text
	.globl main
	
main:
	ori $8, $0, 5		# Initialize register
	ori $9, $0, 5		
	
	beq $8, $9, equal	# Go to equal if $8 == $9
	sll $0, $0, 0
	
	# Since $8 != $9
	ori $10, $0, 0		# Set reg. $10 to 0
	j end_if		# Continue execution
	sll $0, $0, 0
	
equal:  ori $10, $0, 1		# Set reg. $10 to 1
end_if:	sll $0, $0, 0