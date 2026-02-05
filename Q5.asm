
  An embedded logger stores event codes in internal RAM from 40H to 5FH, but due to strict memory limitations the data must be compacted in-place without using any additional RAM or the stack. Write an assembly language program that scans the memory range 40H–5FH using only indirect addressing, removes all occurrences of the value FFH, shifts the remaining valid data bytes to the left to eliminate gaps, and fills the unused memory locations at the end of the range with 00H. Execute the program to show the RAM contents before and after execution, and clearly explain the pointer movement logic used to identify valid data, shift it correctly, and overwrite invalid entries under the given constraints.
ORG 0000H

    MOV R0, #40H       ; Read pointer (source)
    MOV R1, #40H       ; Write pointer (destination)
    MOV R2, #20H       ; Counter = 32 bytes

SCAN:
    MOV A, @R0         ; Read byte from RAM
    CJNE A, #0FFH, VALID
    SJMP NEXT          ; If FFH, skip writing

VALID:
    MOV @R1, A         ; Store valid data
    INC R1             ; Advance write pointer

NEXT:
    INC R0             ; Advance read pointer
    DJNZ R2, SCAN      ; Loop 32 times


    MOV A, #00H

FILL:
    CJNE R1, #60H, CONT
    SJMP DONE

CONT:
    MOV @R1, A
    INC R1
    SJMP FILL

DONE:
    SJMP DONE          ; Stop execution

END
