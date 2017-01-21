.intel_syntax noprefix

.global g
.global fxp5
.data
fxp5:	.string		"a = %ld b = %ld c = %ld d = %ld e = %ld sum = %ld\n"
.str_xp5_0:
        .asciz  "a = %ld b = %ld c = %ld d = %ld = e = %ld sum = %ld\n"
.str_xp5_1:
        .asciz  "a = %ld b = %ld a*b = %ld\n"
g:	
 	.quad 256
	

.text

.global p

p: 
	lea		rax, [rsi+rdi]
	shl 	rax, 2
	dec		rax
	ret

.global q

q:	
	mov		rsi, rdi
	neg		rsi
	mov		rdi, [g]
	call	p
	ret 	

.global f
	
f:
	cmp rdi, 0    #rdi is for first parameter, rci for the second one. rcx, rdx for third and 4th parameters
	jle f0
	push rdi
	dec rdi
	call f
	pop rdi
	imul rax, rdi
	ret
f0:
	mov rax, 1
	ret




.global xp5

xp5:	
		#version 2
		
		push    rbp
        mov     rbp, rsp
        sub     rsp, 40
        mov     qword ptr [rbp - 8], rdi 
        mov     qword ptr [rbp - 16], rsi
        mov     qword ptr [rbp - 24], rdx
        mov     qword ptr [rbp - 32], rcx
        mov     qword ptr [rbp - 40], r8
        sub 	rsp, 8 		# local variable space

        mov     rax, [rbp - 8]          # sum = a + b + c + d + e
        add     rax, [rbp - 16]
        add     rax, [rbp - 24]
        add     rax, [rbp - 32]
        add     rax, [rbp - 40] 
        mov     qword ptr [rbp - 48], rax
        lea     rdi, .str_xp5_0         # printf(.str_xp5_0, a, b, c, d, e, sum)
        mov     rsi, [rbp - 8]
        mov     rdx, [rbp - 16]
        mov     rcx, [rbp - 24]
        mov     r8,  [rbp - 32]
        mov     r9,  [rbp - 40]
        mov     rax, 0                  # 0 floating point args
        push    qword ptr [rbp - 48]
        call    printf
        add     rsp, 8                  # restore stack after call
        mov     rax, [rbp - 8]          # a*b
        mul     qword ptr [rbp - 16]
        mov     rcx, rax
        lea     rdi, .str_xp5_1         # printf(.str_xp5_1, a, b, a*b)
        mov     rsi, [rbp - 8]
        mov     rdx, [rbp - 16]
        mov     rax, 0                  # 0 floating point args
        call    printf
        # restore pointer registers and return
        mov     rsp, rbp                # restore stack pointer
        pop     rbp                     # restore base pointer  
        ret







		#mov	edi, offset flat:mystring
		#You can just use 'lea rdi, mystring' when passing a string as an argument. clang seems fine with that too, though apparently it's buggy in other ways with masm intel