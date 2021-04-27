BITS 64

global ft_strlen

ft_strlen:
	push	rcx			;save rcx
	xor		rcx, rcx	;init rcx at 0

ft_strlen_next:
	cmp		byte [rdi], 0	;
	jz		ft_strlen_end

	inc		rcx
	inc		rdi
	jmp		ft_strlen_next

ft_strlen_end:
	mov		rax, rcx

	pop		rcx
	ret
