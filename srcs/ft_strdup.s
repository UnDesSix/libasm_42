BITS 64

global ft_strdup
extern malloc

; The function is not protected against null arg and non null-byte terminated string

ft_strdup:
	jmp		ft_strlen		; compute size of str first

ft_strdup_malloc:
	push	rbx				; save rbx on stack
	mov		rbx, rdi		; save the address of the initial string into rbx

	mov		rdi, rcx		; save rdi (aka malloc's 1st arg) into rcx (aka length)
;	call	malloc wrt ..plt; malloc fuinction return either new str address either NULL
	call	malloc
	cmp		rax, 0			; check if malloc fail, meaning is rax == 0 ?
	je		ft_strdup_end	
	mov		rdi, rax		; rdi is 1st arg => dst string
	mov		rsi, rbx		; rsi is 2nd arg => src string
	jmp		ft_strcpy		; make the copy

ft_strdup_copy_end:
	mov		byte [rdi + rcx], 0	; put a null-byte at the end of the new str
	mov		rax, rdi			; put the address of new str into rax (aka the return value)

ft_strdup_end:
	pop		rbx		; restore rbx and rcx
	pop		rcx
	ret

ft_strlen:
	push	rcx			; save value
	xor		rcx, rcx	; init rcx

ft_strlen_next:
	cmp		byte [rdi + rcx], 0		; is a null-byte?
	je		ft_strdup_malloc		; if so, rcx == length
	inc		rcx						; otherwise increment and loop
	jmp		ft_strlen_next

ft_strcpy:
	xor		rcx, rcx	; init rcx

ft_strcpy_next:
	cmp		byte [rsi + rcx], 0		; is a null-byte ?
	je		ft_strdup_copy_end		; if so strdup is done
	mov		dl, byte [rsi + rcx]	; mov src[i] into tmp
	mov		byte [rdi + rcx], dl	; mov tmp into dst[i]
	inc		rcx						; increment index
	jmp		ft_strcpy_next			; loop
