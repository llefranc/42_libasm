	default rel
	global	_ft_list_remove_if
	extern	_free

	section .text

	; typedef struct	s_list
	; {
	;	void			*data;
	;	struct s_list	*next;
	; }					t_list;

	; void ft_list_remove_if(t_list **begin_list, void *data_ref,
	; 							int (*cmp)(), void (*free_fct)(void *));
_ft_list_remove_if:
	mov r8, rdi					; **begin_list
	mov r9, rsi					; *data_ref
	mov r10, rdx				; (*cmp)
	mov r11, rcx				; (*free_fct)

	cmp r8, 0					; if **begin_list == NULL we ret and function do nothing
	je end						; (for avoiding segfault)
	cmp qword [r8], 0			; if *begin_list == NULL we ret and function do nothing
	je end
	cmp r9, 0					; if *data_ref == NULL we ret and do nothing
	je end
	cmp r10, 0					; if *cmp == NULL we ret
	je end
	cmp r11, 0					; if *free_fct == NULL we ret
	je end

	mov r12, [r8]				; *ptr on first elem of the list

comp:
	cmp r12, 0					; if elem is NULL we reached end of list
	je end

	mov rdi, [r12]				; set first argument (elem->data)
	mov rsi, r9					; set second argument (data_ref)

	push r8						; caller-save register
	push r9						; caller-save register
	push r10					; caller-save register
	push r11					; caller-save register
	push r12					; caller-save register
	
	call r10					; calling (*cmp) function

	pop r12						; restore caller-save register
	pop r11						; restore caller-save register
	pop r10						; restore caller-save register
	pop r9						; restore caller-save register
	pop r8						; restore caller-save register

	mov r13, r12				; saving elem address in case we want to remove it
	mov r12, [r12 + 8]			; elem = elem->next
	
	cmp rax, 0					; if elem->data != dataref we continue and treat next elem
	jne comp
	
relink_elems:
	mov rax, [r8]				; moving first elem in rax
	cmp rax, r13				; if the elem that need to be removed is the first
	je relink_first_ptr
	
	cmp [rax + 8], r13			; if the elem to removed is the second in the list
	je relink_prev_and_next
	
loop_until_prev_elem:
	cmp [rax + 8], r13			; we move from first elem to the previous elem before
	je relink_prev_and_next		; the one we have to remove
	
	mov rax, [rax + 8]			; elem = elem->next
	jmp loop_until_prev_elem
	
relink_prev_and_next:
	mov r14, [r13 + 8]			; remove->next saved in r14
	mov [rax + 8], r14			; prev->next = elem->next
	jmp remove
	
relink_first_ptr:
	mov rax, [rax + 8]			; elem = elem->next
	mov [r8], rax				; *begin_list = elem

remove:
	mov rdi, [r13]				; set first argument (elem->data_ref)
	
	push r8						; caller-save register
	push r9						; caller-save register
	push r10					; caller-save register
	push r11					; caller-save register
	push r12					; caller-save register
	push r13					; caller-save register
	
	sub rsp, 8					; stack aligned on 16 byte boundary
	call r11					; calling free_function
	add rsp, 8

	pop r13						; restore caller-save register
	mov rdi, r13				; set first argument (elem)
	push r13					; caller-save register
	
	sub rsp, 8					; stack aligned
	call _free					; freeing the element
	add rsp, 8
	
	pop r13						; restore caller-save register
	pop r12						; restore caller-save register
	pop r11						; restore caller-save register
	pop r10						; restore caller-save register
	pop r9						; restore caller-save register
	pop r8						; restore caller-save register

	jmp comp					; when we have removed the elem, we check the next one
	
end:
	ret
