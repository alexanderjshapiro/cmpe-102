	AREA Code, CODE
	EXPORT __main
	ALIGN
	ENTRY
	
__main PROC
	; Homework 3, Exercise 1
	; Write an assembly program that stores R0, which should have its contents as 0xAABBCCDD, at address 0x20004000.
	; You will notice that by default the contents of R0 will be stored in memory in little endian format. Now, your program should convert this 32-bit number stored in the memory from little endian to big endian. Make sure the result is saved back in memory.
	
	; Set up the problem by storing the value at the memory location
	LDR R10, =0xAABBCCDD
	LDR R1, =0x20004000
	STR R10, [R1]
	
	; Retreive the value from memory
	LDR R0, [R1]
	
	; Store the value in reverse order by rotating to the next desired byte and storing that byte
	ROR R0, #24
	STRB R0, [R1], #1
	
	ROR R0, #24
	STRB R0, [R1], #1
	
	ROR R0, #24
	STRB R0, [R1], #1
	
	ROR R0, #24
	STRB R0, [R1], #1
	
stop	B stop
	ENDP
	END