################################################################
# logic.asm
# By Angel Rosario
# This program demonstrates bitwise logic operators.
#    Operator        Symbol
#    -----------     ------
#    Bitwise and     &
#    Bitwise or      |
#    Bitwise xor     ^
################################################################

         .text
         .globl main

main:
         ori $8, $0, 0xd9      # loads 0xd9 into $8
         ori $9, $0, 0x4c      # loads 0x4c into $9
         
         and $10, $8, $9       # $10 = $8 & $9
         or $11, $8, $9        # $11 = $8 | $9
         xor $12, $8, $9       # $12 = $8 ^ $9
         
         andi $13, $8, 0x368f  # $13 = $8 & 0x368f
         ori $14, $8, 0x368f   # $14 = $8 | 0x368f
         xori $15, $8, 0x368f  # $15 = $8 & 0x368f

# end of program