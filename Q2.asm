;Execute an 8051-assembly language program for a safety-certified system in which the instructions CJNE, DJNZ, and SUBB are not permitted. Two unsigned numbers are stored in internal RAM locations 50H and 51H. The program must compare these two numbers using only the allowed instruction set (MOV, INC, DEC, JZ, JNZ, CLR, SETB, ANL, ORL) and store the comparison result in a register or memory location such that 01H indicates the value at 50H is greater than the value at 51H, 00H indicates both values are equal, and FFH indicates the value at 50H is less than the value at 51H. The program should be simulated for all three possible cases (A > B, A = B, A < B), and the solution must clearly explain how flag behavior (especially the Zero flag) is utilized to achieve comparison under the given instruction constraints.


ORG 0000H

MOV A, 50H        ; Load first number
MOV R0, A

MOV A, 51H        ; Load second number
MOV R1, A

CHECK:
MOV A, R0
JZ A_ZERO         ; If R0 is zero

MOV A, R1
JZ B_ZERO         ; If R1 is zero

DEC R0
DEC R1
JNZ CHECK         ; Continue comparison loop

; If both become zero simultaneously
EQUAL:
MOV 52H, #00H     ; A = B
SJMP END

A_ZERO:
MOV A, R1
JZ EQUAL          ; Both zero → equal
MOV 52H, #0FFH    ; A < B
SJMP END

B_ZERO:
MOV 52H, #01H     ; A > B

END:

