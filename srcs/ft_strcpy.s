BITS 64

global ft_strcpy

ft_strcpy:
	push	rcx
	xor		rcx, rcx

ft_strcpy_next:
	cmp		byte [rsi+rcx], 0
	jz		ft_strcpy_end

	mov		dl, byte [rsi+rcx]
	mov		byte [rdi+rcx], dl
	inc		rcx
	jmp		ft_strcpy_next

ft_strcpy_end:
	mov		byte [rdi+rcx], 0
	mov		rax, rdi

	pop		rcx
	ret
