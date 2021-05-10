	AREA Code, CODE
	EXPORT __main
	ALIGN
	ENTRY
	
__main	PROC
	; Question 1:
	;	UsageFault
	;		- Exception Number: 1
	;		- Priority: Programmable
	
	LDR R12, =0xABCDEF01
	
	; Question 3:
	LDR R4, =0xE000ED14		; Load the CCR address into R4
	LDR R5, [R4]			; Load the CCR at R4 into R5
	LDR R6, =0x10			; Load 0x10 (0001 0000) into R6
	ORR R5, R5, R6			; Bitwise OR R5 and R6 into R5 to enable bit #4 of R5
	STR R5, [R4]			; Store R5 into the CCR at R4
	
	; Question 2:
	LDR R0, =0x1
	LDR R1, =0x0
	SDIV R2, R0, R1			; Signed divide R0 / R1 (i.e. 1 / 0) into R2
	
	; Question 4:
	; There is an indication that a divide-by-zero fault occurred

stop	B stop				; Capture the debugger to see the register values after the program finishes
	ENDP

HardFault_Handler PROC
	EXPORT HardFault_Handler
	NOP
	; Question 6:
	; The contents of the registers are in the stack
	
	; Question 7:
	; The link register has a value of 0xFFFFFFF9, indicating the MSP will be used to restore the registers when the interrupt finishes
	
	; Question 8:
	LDR R4, =0xE000ED2A		; Load the UsageFault status register address into R4
	LDR R5, [R4]			; Load the UsageFault status register into R5
	; Bit #9 is one (0x00000200 -> 0000 ... 0000 0010 0000 0000), indicating a divide-by-zero fault occurred
		
trap	B trap				; Capture the debugger to see the register values after the program finishes
	ENDP

	END