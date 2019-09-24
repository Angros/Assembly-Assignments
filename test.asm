################################################################
# addu_instruction.asm
# By Angel Rosario
# This program assembles an instruction into register $25.

################################################################

         .text
         .globl main

main:

	addu $10, $8, $9 