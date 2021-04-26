BITS 64

global _ft_strlen

_ft_strlen:
	push	rcx
	xor		rcx, rcx

_ft_strlen_next:
	cmp		byte [rdi], 0
	jz		_ft_strlen_end

	inc		rcx
	inc		rdi
	jmp		_ft_strlen_next

_ft_strlen_end:
	mov		rax, rcx

	pop		rcx
	ret
