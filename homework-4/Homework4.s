	AREA Code, CODE
	EXPORT __main
	ALIGN
	ENTRY
	
__main	PROC
	; Homework 4
	; Pass to a subroutine an array by reference (i.e. pass the address of the array), the size of the array, and a number.
	; The subroutine should search for that number within the array elements and return the index of the array element if the matching number is found.
	; If no matching number is found, then the subroutine should return -1.
	
	; Set up the problem
	LDR R10, =0x20004000
	LDR R4, =0xC
	LDR R5, =0x4
	LDR R6, =0x1
	LDR R7, =0xA		; The desired value is in the array at index 3
	LDR R8, =0x8
	STM R10, {R4 - R8}
	
	LDR R1, =0x20004000
	LDR R2, =5
	LDR R3, =0xA
	
	BL search			; Call the search procedure

stop	B stop			; Capture the debugger to see the register values after the program finishes
	ENDP

; Search for value R3 in array R1 of size R2
search	PROC
	PUSH {R4 - R5} 		; Store variable registers R4 and R5 so the registers can be used by the procedure
	
	LDR R0, =-1			; Prepare the return register R0 with a default value of -1 in case no matching value is found
	LDR R4, =0			; Initialize the index counter R4 to be 0

loop
	LDR R5, [R1], #4	; Load the next value from the array into R5
	TEQ R5, R3			; Test for equivalence the value R5 and the desired value R3
	
	MOVEQ R0, R4		; If the value R5 matches the desired value R3, copy the index counter R4 into the return register R0
	MOVEQ R2, R4		; Copy the array size R2 into the index counter R4 to stop the loop from continuing
	
	ADD R4, R4, #1		; Increment the index counter R4
	CMP R4, R2			; Compare the index counter R4 to the array size R2
	BLT loop			; Loop again if the index counter R4 is less than the array size R2
	
	POP {R4 - R5} 		; Retrieve variable registers R4 and R5 now that the procedure is finished
	BX LR 				; Return to the instruction after the procedure call
	ENDP

	END