	default	rel
	global	_ft_read
	extern	___error

	section .text

	; ssize_t	ft_read(int fildes, void *buf, size_t nbyte);
_ft_read:
	mov rax, 0x2000003	; sys_read
	syscall
	jnc no_error		; if no error we jump to return value
	
	mov rbx, rax		; saving read error value (future errno)
	push rbx			; save-caller register

	call ___error		; return in rax *int on errno var

	pop rbx				; restore save-caller register
	
	mov [rax], rbx		; copy error return value in *int errno
	mov rax, qword -1	; if error we return -1
	
no_error:
	ret
