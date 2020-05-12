	default rel
	global	_ft_list_sort

	section .text

	; typedef struct	s_list
	; {
	;	void			*data;
	;	struct s_list	*next;
	; }					t_list;

	; void ft_list_sort(t_list **begin_list, int (*cmp)());
_ft_list_sort:
	cmp rdi, 0					; if **begin_list == NULL we ret and func do nothing to avoid segfault
	je end
	cmp qword [rdi], 0			; same if *begin_list == NULL
	je end
	
	mov r11, rdi				; we save the ptr **begin_list
	mov r12, rsi				; we move function in r11 so we can use rsi for passing argument
	
restart_from_beginning:
	mov r9, [r11]				; putting address of first elem of the list in r9
	
continue_loop:
	mov rdi, [r9]				; data of first elem
	cmp qword [r9 + 8], 0		; if *next value is NULL, we reached the end of the list >> sorted
	je end
	
	mov r10, [r9 + 8]			; moving in r10 value of *next (add)
	mov rdi, [r9]				; set first argument (first->data)
	mov rsi, [r10]				; set second argument (second->data)

	push r9						; caller-save register
	push r10					; caller-save register
	push r11					; caller-save register
	push r12					; caller-save register
	
	sub rsp, 8					; stack aligned
	call r12					; call (*cmp)
	add rsp, 8;

	pop r12						; restore caller-save register
	pop r11						; restore caller-save register
	pop r10						; restore caller-save register
	pop r9						; restore caller-save register
	
	cmp rax, 0					; comparing (*cmp) return value
	jle sort_next_elem			; if less or equal > already sorted, we treat the next two elems
	
	mov r13, [r9]				; r13 is temp register for swap *data between the 2 elems 
	mov r14, [r10]				; same for r14
	mov [r9], r14				; swap the 2 *data
	mov [r10], r13
	jmp restart_from_beginning
	
sort_next_elem:
	mov r9, r10					; we go to next elem
	jmp continue_loop
	
end:
	ret
	