	AREA Code, CODE
	EXPORT __main
	ALIGN
	ENTRY
	
__main PROC
	; Homework 2, Exercise 2
	; You have a 64-bit number 0xCCCCCCCCAAAAAAAA. Write an assembly program to implement 64-bit Logic Shift Right. Shift this 64-bit number right by 4.
	
	; Load 0xCCCCCCCCAAAAAAAA across two 32-bit registers
	LDR R0, =0xCCCCCCCC
	LDR R1, =0xAAAAAAAA
	
	; Load the number of times to shift right in a register so it can be changed easily
	LDR R2, =4
	
	; Copy the more significant half into a temporary register
	MOV R10, R0
	
	; Keep track of the bits of the more significant half that will be shifted out by shifting left the opposite number of times
	LDR R11, =32
	SUBS R11, R11, R2 ; e.g. 4 shifts right becomes 28 shifts left
	LSL R10, R10, R11 ; e.g. 0xCCCCCCCC becomes 0xC0000000
	
	; Shift each half right
	LSR R3, R0, R2
	LSR R4, R1, R2
	
	; Add the less significant half and the bits that were shifted out of the more significant half
	ADD R4, R4, R10 ; e.g. 0x0AAAAAAA + 0xC0000000 becomes 0xCAAAAAAA

stop	B stop
	ENDP
	END