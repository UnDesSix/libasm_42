BITS 64

global ft_strcpy

ft_strcpy:
	push	rcx			; save rcx into stack
	xor		rcx, rcx	; init rcx at 0

ft_strcpy_next:
	cmp		byte [rsi + rcx], 0	; is [rsi] a null-byte?
	jz		ft_strcpy_end		; is so, got to the end

	mov		dl, byte [rsi+rcx]	; save in a tmp register
	mov		byte [rdi+rcx], dl	; mov the tmp into final destination
	inc		rcx					; increment the index
	jmp		ft_strcpy_next		; make a loop

ft_strcpy_end:
	mov		byte [rdi+rcx], 0	; put the null-byte at the end of the string
	mov		rax, rdi			; save the address of the strind into rax

	pop		rcx					; restore rcx value
	ret
