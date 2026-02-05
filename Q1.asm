Q1 :Write an 8051 Assembly Language Program (ALP) to generate the last four digits of your PRN using any arithmetic instructions. The program should not directly load the complete PRN number as an immediate value. Instead, it must use appropriate arithmetic operations such as ADD, MUL, or INC to form the number logically. The final result must be stored in the Accumulator register (AX). For example, if a student’s PRN is 24070521211, the last four digits are 1211, and the value 1211 should be available in AX at the end of program execution.


ORG 0000H

MOV A, #10        ; Load 10 into Accumulator
MOV B, #100       ; Load 100 into B register
MUL AB            ; A = 10 × 100 = 1000

MOV R0, A         ; Store 1000 (lower byte) in R0

MOV A, #38        ; Load 38
ADD A, R0         ; A = 1000 + 38 = 1038

HERE: SJMP HERE   ; End of program

END
