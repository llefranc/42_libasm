	default rel
	global	_ft_list_push_front
	extern	_ft_create_elem

	section .text

	; typedef struct	s_list
	; {
	;	void			*data;
	;	struct s_list	*next;
	; }					t_list;

	; void	ft_list_push_front(t_list **begin_list, void *data);
_ft_list_push_front:
	cmp rdi, 0				; if **begin_list = NULL, jump to return to avoid segfault. Func do nothing
	je end
	mov r8, rdi				; **begin_list now in r8
	mov rdi, rsi			; set first argument (data)
	
	push r8					; caller-save register
	
	sub rsp, 8				; stack aligned on 16 byte boundary
	call _ft_create_elem	; address of new elem in rax
	add rsp, 8

	pop r8					; restore caller-save register

	mov r9, [r8]			; adress of first list elem in r9 now (using **begin_list)
	mov [rax + 8], r9		; new->next now pointing on first list elem (adding 8 to skip *data and access *next)
	mov [r8], rax			; updating begin_list ptr with new created elem
	
end:
	ret						; void return so no need to take care of rax
