################################################################
# shift.asm
# By Angel Rosario
# This program demonstrates bitwise shift logical operators.
#    Operator              Symbol
#    -----------           ------
#    shift left logical     <<
#    shift right logical    >>> 
################################################################

         .text
         .globl main

main:

	ori $8, $0, 0xd9      # loads 0xd9 into $8
	sll $10, $8, 2	      # $10 = $8 << 2
	srl $11, $8, 2	      # $11 = $8 >>> 2
	
# End of program 