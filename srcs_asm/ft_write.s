	default rel
	global	_ft_write
	extern	___error

	section .text

	; ssize_t	ft_write(int fildes, const void *buf, size_t nbyte);
_ft_write:
	mov rax, 0x2000004	; sys_write
	syscall				; arg for write are already stored in rdi, rsi, rdx
	jnc no_error		; if no error (= no carry flag after syscall) we jump to return value
	
	; ----- IF ERROR OCCURED -----
	mov rdx, rax		; saving return value (= future errno) in rdx
	
	push rdx			; caller-save register
	
	call ___error		; return in rax *int to errno
	
	pop rdx				; restore caller-save register
	
	mov [rax], rdx		; moving return value of errored sys_write to *int errno location
	mov rax, -1			; set return value to -1 because error occured during sys_write
	
no_error:
	ret
