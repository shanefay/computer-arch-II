.intel_syntax noprefix
.global g
.data
g:
	.long 256
.text
.global p
p: push ebp
	mov ebp, esp
	sub esp, 4
	mov eax, [ebp+8]
	add eax, [ebp+12]
	mov [ebp-4], eax
	shl eax, 2
	dec eax
	mov esp, ebp
	pop ebp
	ret

.global q
q:
	push ebp
	mov ebp, esp
	mov eax, [ebp+8]
	neg eax
	push eax
	push g
	call p
	mov esp, ebp
	pop ebp
	ret

.global f
f:
	push ebp
	mov ebp, esp
	mov eax, [ebp+8]
	cmp eax, 0
	jle f0
	dec eax
	push eax
	call f
	mul DWORD PTR [ebp+8] 
	mov esp, ebp
	pop ebp
	ret
f0:
	mov eax, 1
	mov esp, ebp
	pop ebp
	ret