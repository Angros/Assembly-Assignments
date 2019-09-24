################################################################
# instruction.asm
# By Angel Rosario
# This program assembles an instruction into register $25.
# The bitwise used is or and ori.
################################################################

         .text
         .globl main

main:
	or $25, $0, $0          # Clear register $25
	
	ori $11, $0, 0xd        # load op-code into $11
	ori $12, $0, 0x9        # load rt into $12
	ori $13, $0, 0x8        # load rs into $13
	ori $14, $0, 0x4a       # load imm into $14
	
	sll $11, $11, 26        # Shift op-code into position
	or $25, $11, $0         # move op-code to $25 (preserve)
	
	sll $12, $12, 21        # Shift rt into position
	or  $25, $12, $25       # move rt to $25 (preserve)
	
	sll $13, $13, 16	# shift rs into position
	or $25, $13, $25	# move rs to $25 (preserve)
	
	or $25, $14, $25        # move imm to $25 (preserve)
	
# End of Program
