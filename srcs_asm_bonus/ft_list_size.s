	default rel
	global	_ft_list_size

	section .text

	; typedef struct	s_list
	; {
	;	void			*data;
	;	struct s_list	*next;
	; }					t_list;

	;int	ft_list_size(t_list *begin_list);
_ft_list_size:
	xor rax, rax
	cmp rdi, 0;				if begin_list is NULL, size list return 0
	je end	
loop_list:
	inc rax;				at each loop, rax is incremented
	mov rdi, [rdi + 8];		moving in rdi the content of elem->next
	cmp rdi, 0
	jne loop_list;			we loop until we reach next = NULL, end of the list
end:
	ret
