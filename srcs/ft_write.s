BITS 64

global ft_write
extern __errno_location

ft_write:
	mov		rax, 1			; call write function, rdi, rsi and rdx are implicit here
	syscall

	cmp		rax, 0			; is there an error ? 
	jl		ft_write_error	; if rax neg then yes
	ret

ft_write_error:
	push	rbx					; save rbx
	mov		rbx, rax			; save rax into rbx
;	call	__errno_location wrt ..plt	; call errno function
	call	__errno_location
	neg		rbx					; rbx *= -1
	mov		[rax], rbx			; rax = address of errno, so move rbx into dereferenced rax
	mov		rax, -1				; put -1 in rax which is the final return value
	pop		rbx					; restore rbx
	ret
