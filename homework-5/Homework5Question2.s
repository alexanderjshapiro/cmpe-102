	AREA Code, CODE
	EXPORT __main
	ALIGN
	ENTRY
	
__main	PROC
	; Homework 5, Question 2
	; Write an assembly program that adds two fractions where the numerators and denominators of the fractions are stored in R1, R2, R3 and R4 respectively, i.e. R1/R2, R3/R4.
	; You do not need to simplify the fraction after adding. The result should be returned in R5 and R6, where R5 hold the numerator and R6 holds the denominator.
	; If one of the denominators is zero, the processor should generate a divide-by-zero exception. The exception should call a HardFault_Handler where -1 is returned in R0.
	
	; Set up the problem
	LDR R1, =1
	LDR R2, =0
	LDR R3, =1
	LDR R4, =0
	
	; Prepare the divide-by-zero fault handler
	LDR R10, =0xE000ED14
	LDR R11, [R10]
	LDR R12, =0x10
	ORR R11, R11, R12 
	STR R11, [R10]
	
	; Verify fractions are numbers
	SDIV R5, R2, R2
	SDIV R5, R4, R4
	
	; Multiply to get common denominator
	MUL R1, R1, R4
	MUL R3, R3, R2
	
	; Add fractions to get result
	ADD R5, R1, R3
	MUL R6, R2, R4

stop	B stop			; Capture the debugger to see the register values after the program finishes
	ENDP

HardFault_Handler PROC
	EXPORT HardFault_Handler
	LDR R0, =-1			; Set the return value to -1
	B stop				; Return to the end of the main procedure
	ENDP

	END