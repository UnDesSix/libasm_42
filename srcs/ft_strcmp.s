BITS 64

global ft_strcmp

ft_strcmp:
	push	rbx
	push	rcx			; save rbx and rcx on the stack
	xor		rcx, rcx
	xor		rax, rax	; init both of them

ft_strcmp_next:
	mov		al, byte [rdi + rcx]
	mov		bl, byte [rsi + rcx]	; use al and bl as a tmp
	cmp		al, 0
	jz		ft_strcmp_end
	cmp		bl, 0
	jz		ft_strcmp_end
	cmp		al, bl
	jne		ft_strcmp_end			; if s1[i] or s2[i] or s1[i] != s2[i] then strcmp_end

	inc		rcx						; increment index
	jmp		ft_strcmp_next			; make a loop

ft_strcmp_end:
	movzx	rax, al		; mozx == xor + mov
	movzx	rbx, bl

	sub		rax, rbx	; diff between s1[i] et s2[i]
	pop		rcx
	pop		rbx			; restore rbx and rbx
	ret
