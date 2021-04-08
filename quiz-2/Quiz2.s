	AREA Code, CODE
	EXPORT __main
	ALIGN
	ENTRY
	
__main PROC
	; Quiz 2
	
	; Set up the problem
	LDR R0, =0x20008008
	LDR R4, =0xFFFFFFFF
	STR R4, [R0]
	
	; 1. Search for "arm EQU compiler directive" on the internet and learn about the use of the EQU compiler directive.
	
; 2. Use the EQU directive to define a constant symbol S_BASE with a value 0x20008008
S_BASE EQU 0x20008008

	; 3. Load the S_BASE value into the SP register (Note: do not use the value 0x20008008 as an immediate number to load into SP. Use the constant symbol S_BASE instead.)
	LDR R13, =S_BASE
	
	; 4. Insert a comment that explains why you might want to use a constant symbol (i.e. S_BASE) instead of the direct value (i.e. 0x20008008). Hint: the same reason why you would define a constant in a high level language.
	; We may want to use a constant where the same value needs to be used multiple times. That value can easily be changed in one place if changes need to be made.
	
	; 5. Load a value to register R1 (you can pick the value)
	LDR R1, =0x45
	
	; 6. Load a value to register R2 (you can pick the value)
	LDR R2, =0x1A4
	
	; 7. Push R1 and R2 to the stack
	PUSH {R1}
	PUSH {R2}
	
	; 8. Run your program and answer the following questions after running your program.
	; a) Which address is the value in R1 stored at?
	; 0x20008008
	; b) Which address is the value in R2 stored at?
	; 0x20008000
	
	; 9. Pop values from the stack to R6 and R7
	POP {R6}
	POP {R7}
	
	; 10. Is your stack full or empty? Explain how you arrived at your conclusion.
	; The stack should be empty because we pushed two values onto the stack, then popped those two values back off of the stack.
	
	; 11. Add the following instruction to your program: POP {R8}
	POP {R8}
	
	; 12. Run your program. You have just caused a stack underflow. Explain the reason why you have caused a stack underflow.
	; The stack was empty, so there was no value to be popped. Instead, the next value in memory, which was not supposed to be part of the stack, was popped.
	
stop	B stop
	ENDP
	END