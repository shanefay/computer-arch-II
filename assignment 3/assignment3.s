.text
.intel_syntax noprefix
	mov r10, #256
.global p
p:
	add r26, r27, r16 	
	sll r16, #2, r1 		
	ret r25, 0 					
											
	sub r1, #1, r1 			
.global q
q:
	add r9, r0, r10			
	callr r25, p 		  	
	sub r0, r26, r11 		
	callr ret r25, 0 		
	add r0, r0, r0 			
.global f
f:
	sub r26, #0, r0 {C}
	jlt basecase
	XOR r0, r0, r0 			
	sub r26, #1, r10 		
	callr _f ret r25, 0
	mul r26, r1, r1
basecase:
	mov r1, #1					