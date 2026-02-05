Q3.A student claims that two assembly programs are equivalent because both access the same RAM address; however, this claim is incorrect due to the difference in addressing modes. In this case study, write two short assembly programs—one using direct addressing and the other using indirect addressing—such that both reference the same RAM location. Using an appropriate initial RAM configuration, demonstrate a situation where the outputs of the two programs differ even though the base address is the same. Support the observation with register and RAM snapshots from simulation, and explain that the difference arises because direct addressing accesses the data stored at the given address, whereas indirect addressing treats the contents of that address as a pointer to another memory location, leading to different data being fetched and hence different outputs.
// indirect addressing mode
MOV R0,30H
MOV A,@R0
MOV R7,A
HERE: SJMP HERE



//DIRECT ADDRESSING MODE
ORG 0000H
MOV A, 30H
MOV R7,A
HERE: SJMP HERE;
END




