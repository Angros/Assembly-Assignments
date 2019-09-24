################################################################
# nor.asm
# By Angel Rosario
# This program demonstrates bitwise nor and not operators.
#    Operator              Symbol
#    -----------           ------
#    Bitwise nor          ~ (a | b)
#    Bitwise not          ~ a
################################################################

         .text
         .globl main

main:
	ori $8, $0, 0xd9      # loads 0xd9 into $8
	ori $9, $0, 0x4c      # loads 0x4c into $9
	
	nor $10, $8, $9       # 10 = ~ ($8 | $9)
	nor $11, $8, $0       # 11 = ~ $8
	nor $12, $9, $0       # $12 = ~ $9