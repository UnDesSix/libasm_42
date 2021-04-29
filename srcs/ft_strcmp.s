BITS 64

global ft_strcmp

ft_strcmp:
	push	rbx
	push	rcx
	xor		rcx, rcx
	xor		rax, rax

ft_strcmp_next:
	mov		al, byte [rdi + rcx]
	mov		bl, byte [rsi + rcx]
	cmp		al, 0
	jz		ft_strcmp_end
	cmp		bl, 0
	jz		ft_strcmp_end
	cmp		al, bl
	jne		ft_strcmp_end

	inc		rcx
	jmp		ft_strcmp_next

ft_strcmp_end:
	movzx	rax, al
	movzx	rbx, bl

	sub		rax, rbx
	pop		rcx
	pop		rbx
	ret
