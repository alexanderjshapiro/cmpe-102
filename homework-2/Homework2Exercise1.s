	AREA Code, CODE
	EXPORT __main
	ALIGN
	ENTRY
	
__main PROC
	; Homework 2, Exercise 1
	; For addition of two 64-bit numbers, we can split 64-bit addition into two 32-bit additions.
	; Consider the following two 64-bit integers:
	; A = 0x00000002FFFFFFFF
	; B = 0x0000000400000001
	; Write an assembly program to do 64-bit addition. Add these two numbers.
	; Hint: Consider using the ADC instruction.
	
	; Load 0x00000002FFFFFFFF across two 32-bit registers
	LDR R0, =0x00000002
	LDR R1, =0xFFFFFFFF
	
	; Load 0x0000000400000001 across two 32-bit registers
	LDR R2, =0x00000004
	LDR R3, =0x00000001
	
	; Add the less significant half of each number and keep track of any carry
	ADDS R5, R1, R3
	
	; Add the more significant half of each number, including the carry from the less significant half
	ADCS R4, R0, R2
	
stop	B stop
	ENDP
	END