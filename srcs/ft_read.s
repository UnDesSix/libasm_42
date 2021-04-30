BITS 64

global ft_read
extern __errno_location

ft_read:
	mov		rax, 0			; call read function, rdi, rsi and rdx are implicit here
	syscall

	cmp		rax, 0			; is there an error ?
	jl		ft_read_error	; if rax neg then yes
	ret

ft_read_error:
	push	rbx					; save rbx value
	mov		rbx, rax			; save error code into rbx
	call	__errno_location wrt ..plt	; call errno function
	neg		rbx					; rbx *= -1
	mov		[rax], rbx			; rax = address of errno, so move rbx into dereferenced rax
	mov		rax, -1				; put -1 in rax which is the final return value
	pop		rbx					; restore rbx value
	ret
