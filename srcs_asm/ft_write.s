	default rel
	global	_ft_write
	extern	___error

	section .text
_ft_write:
	mov rax, 0x2000004	; sys_write
	syscall				; arg for write are already stored in rdi, rsi, rdx
	jnc no_error		; if no error (= no carry flag after syscall) we jump to return value
	
	; ----- IF ERROR OCCURED -----
	mov rdx, rax		; saving return value (= future errno) in rdx
	sub rsp, 8			; stack must be aligned on 16 bytes boundary and call ___error add one address (8 bytes) on the stack
	call ___error		; return in rax *int to errno
	add rsp, 8			; stack realigned
	mov [rax], rdx		; moving return value of errored sys_write to *int errno location
	mov rax, -1			; set return value to -1 because error occured during sys_write
	
no_error:
	ret
