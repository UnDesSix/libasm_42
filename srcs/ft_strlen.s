BITS 64

global ft_strlen

ft_strlen:
	push	rcx			; save rcx into stack
	xor		rcx, rcx	; init rcx at 0

ft_strlen_next:
	cmp		byte [rdi + rcx], 0	; is [rdi] a null-byte ?
	jz		ft_strlen_end		; if so, go to the end

	inc		rcx					; increment the index rcx
	jmp		ft_strlen_next		; make a loop

ft_strlen_end:
	mov		rax, rcx	; move the index into the register rax (return value)

	pop		rcx			; put back the initial value into rcx
	ret					; end of the function, return rax
