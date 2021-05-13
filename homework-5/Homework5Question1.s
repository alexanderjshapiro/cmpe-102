	AREA Code, CODE
	EXPORT __main
	ALIGN
	ENTRY
	
__main	PROC
	; Homework 5, Question 1
	; Write the ARM assembly instructions to translate the following C program into an assembly program where r1 is data read from the memory address 0xE000E010.
	; int r0 = 0;
	; for (int i = 0; i < 32; i++) {
	;     r0 = r0 | (r1 << i);
	; }
	
	LDR R0, =0xE000E010
	LDR R1, [R0]
	
	LDR R0, =0				; int r0 = 0
	
	LDR R2, =0				; int i = 0
loop						; for begin
	LSL R11, R1, R2			; (r1 << i)
	ORR R0, R0, R11			; r0 = r0 | (r1 << i)
	
	ADD R2, R2, #1			; i++
	CMP R2, #32				; i < 32
	BLO	loop				; for end

stop	B stop			; Capture the debugger to see the register values after the program finishes
	ENDP

	END