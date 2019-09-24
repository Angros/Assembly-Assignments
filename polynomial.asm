################################################################
# polynomial.asm
# This program evaluates 5x^2 -12x + 97
#
# Register use:
# $10  Base register, address of x
# $11  Value of x
# $12  Accumulator; Value of poly
# $13  Temporary
################################################################

          .data
x:        .word 17
poly:     .word 0

          .text
          .globl main
main:
          lui $10, 0x1001     # load base address into $10
          lw $11, 0($10)      # load value of x into $11
          
          ori $12, $0, 97     # initialize accumulator

          ori $13, $0, 12     # put 12 in temp register
          
          mult $13, $11       # compute 12 * x
          mflo $13            # put 12 * x in $13
          
          subu $12, $12, $13 # accumulator = -12x + 97
          
          mult $11, $11      # compute x ^ 2
          mflo $11           # put x ^ 2 in $11
          
          ori $13, $0, 5     # put 5 in temp register
          
          mult $13, $11      # compute 5 * x ^ 2
          mflo $13           # put 5 * x ^ 2 in temp register
          
          addu $12, $13, $12 # compute  5 * x ^ 2 -12 * x + 97
          
          sw $12, 4($10)      # store result in poly
          
# End of program
