	AREA Code, CODE
	EXPORT __main
	ALIGN
	ENTRY
	
__main PROC
	; Homework 3, Exercise 2
	; An array of ten 32-bit numbers is stored in registers R1 to R10. Store this array to memory starting from address 0x20004000 using a single STM (store multiple registers) instruction.
	; Write an assembly program to add all elements of the array and store the result in R0.
	; Use post-index addressing to access the array elements in memory, i.e., the array elements should be retrieved from memory using post-index addressing.
	
	; Set up the problem by loading the numbers into the registers and storing the array from the registers at the memory address
	LDR R1, =1
	LDR R2, =2
	LDR R3, =3
	LDR R4, =4
	LDR R5, =5
	LDR R6, =6
	LDR R7, =7
	LDR R8, =8
	LDR R9, =9
	LDR R10, =10
	
	LDR R11, =0x20004000
	STM R11, {R1 - R10}
	
	; Loop through the array in memory and find the sum
	; Start the sum at zero and the counter at one
	EOR R0, R0
	LDR R1, =1
	
loop
	; Get the next number and add it to the sum
	LDR R12, [R11], #4
	ADD R0, R0, R12
	
	; Increment the counter and check if all the numbers have been added
	ADD R1, #1
	CMP R1, #10
	BLE loop
	
stop	B stop
	ENDP
	END