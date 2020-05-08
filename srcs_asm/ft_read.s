	default	rel
	global	_ft_read
	extern	___error

	section .text
_ft_read:
	mov rax, 0x2000003; sys_read
	syscall
	jnc no_error; if no error we jump to return value
	mov rbx, rax; saving read error value (future errno)
	sub rsp, 8; need to align the stack on 16 bytes boundarie
	call ___error; return in rax *int on errno var
	add rsp, 8; realign the stack
	mov [rax], rbx; copy error return value in *int errno
	mov rax, qword -1; if error we return -1
no_error:
	ret
