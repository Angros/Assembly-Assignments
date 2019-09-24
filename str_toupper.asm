############################################################
# str_toupper.asm
# Produces the String Characters in uppercase letters.
#
# Angel Rosario
# 841-12-7893
# 7-mayo-2014
#
# Register use:
# $8 -- counter
# $9 -- pointer
# $10 - char
# $11 - Scratch
# $12 - contains number 32
# $13 - lower to upper case letter
############################################################
	  	.data
string:   	.asciiz "I love MIPS Assembly."
upper:  	.space 81

		.text
		.globl main
main:
		ori $8, $8, 0		# initialize counter
		lui $9, 0x1001		# point to first char
		
		
loop: 		lb $10, 0($9)		# obtain char		
		beq $10, $0, endLoop	# end loop if char is null
		sll $0, $0, 0
				
if:		slti $11, $10, 97	# exit loop if char < 97
		beq $11, $0, minLetter	# char >= 97
		j endIf			# jump to 'endLoop'
		sll $0, $0, 0
		
		
minLetter: 	slti $11, $10, 123	# if char < 123
		beq $11, $10, endLoop	# exit loop if char >= 123
		
		ori $12, $0, 32		# insert number 32 in $12
		sub $13, $10, $12	# lower case char - 32 = upper case char
		
		sb $13, 0($9)		# Store sentence in upper case letters			
											
endIf:		
		addi $8, $8, 1		# counter = counter + 1
		addiu $9, $9, 1		# point next char
		
		j loop			# jump to 'loop'
		sll $0, $0, 0
		
endLoop: 	sll $0, $0, 0		
	
# End of Program