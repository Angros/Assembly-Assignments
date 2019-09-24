#################################################
# addup.asm
# By Angel Rosario
# This program adds registers
#################################################

.text
.globl main

main:
          ori $8, $0, 2     # loads 2 into register $8
          ori $9, $0, 3     # loads 3 into register $9
          add $10, $8, $9   # set $10 to $8 + $9
      
# end of program