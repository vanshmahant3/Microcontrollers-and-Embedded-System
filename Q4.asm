Write an 8051 Assembly Language Program in which you must use logical instructions to construct a numeric result. Using multiple logical instructions such as ANL, ORL, and CLR, generate the last four digits of your own mobile number through a suitable sequence of operations (you may split the digits and combine them logically as required). Do not directly load the complete 4-digit number as an immediate value. The program should use more than one logical instruction, and at the end of execution the Accumulator (A) must contain the last four digits of your mobile number. Simulate the program and verify that the final value in the Accumulator matches your mobile number’s last four digits.

ORG 0000H

CLR A             ; Clear Accumulator

MOV A, #1FH       ; Load 1FH
ANL A, #18H       ; Mask bits using AND
MOV R0, A         ; Store result in R0

MOV A, #1EH       ; Load 1EH
ORL A, #02H       ; Logical OR operation
MOV R1, A         ; Store result in R1

MOV A, R0         ; Move R0 to A
SWAP A            ; Swap nibbles
ORL A, R1         ; Combine logically

HERE: SJMP HERE   ; Infinite loop

END
