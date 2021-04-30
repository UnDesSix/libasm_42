BITS 64

global ft_read
extern __errno_location

ft_read:
	mov		rax, 0
	syscall

	cmp		rax, 0
	jl		ft_read_error
	ret

ft_read_error:
	push	rbx
	mov		rbx, rax
	call	__errno_location
	neg		rbx
	mov		[rax], rbx
	mov		rax, -1
	pop		rbx
	ret
