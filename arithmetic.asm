################################################################
# arithmetic.asm
# By Antonio F. Huertas
# This program demonstrates arithmetic operators.
#
# Register use:
#   $8   first value
#   $9   second value
#
#   $10  result of adding second and first values
#   $11  result of subtracting second and first values
#   $12  product (significant part) of second and first values
#   $13  quotient of division of second and first values
#   $14  remainder of division of second and first values
################################################################

         .text
         .globl main

main:
         ori $8, $0, 2         # load 2 into $8  (zero ext.)
         addi $9, $0, -7       # load -6 into $9 (sign ext.)
         
         add $10, $9, $8       # $10 = $9 + $8
         sub $11, $9, $8       # $11 = $9 - $8
         
         mult $9, $8           # hi,lo = $9 * $8
         mflo $12              # $12 = lo
         
         div $9, $8            # lo = $9 / $8; hi = $9 % $8
         mflo $13              # $13 = lo
         mfhi $14              # $14 = hi
       
# End of program