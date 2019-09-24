################################################################
# shift_v2.asm
# By Angel Rosario
# This program demonstrates bitwise shift logical and artihmetic operators.
#
#    Operator                Symbol
#    -----------             ------
#    shift left logical       <<
#    shift right logical      >>>
#    shift right arithmetic   >> 
#
#    Register use:
#      $8   value
#      $10  left logical shifting of value by 2 positions
#      $11  right logical shifting of value by 2 positions
#      $12  right arithmetic shifting of value by 2 positions
################################################################

         .text
         .globl main

main:

	ori $8, $0, -4        # loads -4 into $8
	sll $10, $8, 2	      # $10 = $8 << 2
	srl $11, $8, 2	      # $11 = $8 >>> 2
	sra $12, $8, 2	      # $12 = $8 >> 2
	
# End of program 
