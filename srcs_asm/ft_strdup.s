	default rel
	global	_ft_strdup
	extern	_malloc
	extern	___error

	section .text
	
	; char	*ft_strdup(const char *s1);
_ft_strdup:
	xor rdx, rdx

loop_s1_len:
	inc rdx							; increment rdx to have the len of s1
	cmp byte [rdi + rdx - 1], 0
	jne loop_s1_len					; loop until we met s1 '\0'
	push rdi						; saving on stack rdi because malloc func call
	mov rdi, rdx					; first arg of malloc (len s1 + 1 for '\0')
	call _malloc
	pop rdi							; taking back from stack saved rdi value
	cmp rax, 0						; check if malloc return value is not NULL ptr
	jne copy_s1						; if no malloc error we jump to copy instruction

	; ----------- IF ERROR OCCURED -----------
	sub rsp, 8						; align the stack
	call ___error					; for setting errno var (from errno.h)
	add rsp, 8
	mov dword [rax], 12				; set errno value (number 12 ENOMEM, out of memory)
	xor rax, rax					; return NULL
	ret
	
copy_s1:
	xor rdx, rdx

loop_s1_copy:
	inc rdx
	mov bl, byte [rdi + rdx - 1]	; copying s1 in new str
	mov byte [rax + rdx - 1], bl
	cmp byte [rdi + rdx - 1], 0
	jne loop_s1_copy				; we loop until s1 '\0'
	ret								; we ret rax wchich contains addr of new str
