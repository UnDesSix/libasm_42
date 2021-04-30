BITS 64

global ft_strdup
extern malloc

ft_strdup:
	jmp		ft_strlen

ft_strdup_malloc:
	push	rbx
	mov		rbx, rdi

	mov		rdi, rcx
	call	malloc
	cmp		rax, 0
	je		ft_strdup_end
	mov		rdi, rax
	mov		rsi, rbx
	jmp		ft_strcpy

ft_strdup_copy_end:
	mov		byte [rdi + rcx], 0
	mov		rax, rdi

ft_strdup_end:
	pop		rbx
	pop		rcx
	ret

ft_strlen:
	push	rcx
	xor		rcx, rcx

ft_strlen_next:
	cmp		byte [rdi + rcx], 0
	je		ft_strdup_malloc
	inc		rcx
	jmp		ft_strlen_next

ft_strcpy:
	xor		rcx, rcx

ft_strcpy_next:
	cmp		byte [rsi + rcx], 0
	je		ft_strdup_copy_end
	mov		dl, byte [rsi + rcx]
	mov		byte [rdi + rcx], dl
	inc		rcx
	jmp		ft_strcpy_next
