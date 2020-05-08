	default	rel
	global	_ft_strcpy

	section .text
_ft_strcpy:
	xor	rax, rax				; putting rax to zero
	cmp	byte [rsi + rax], 0		; if we reached the \0 of src
	je	end_loop				; we jump to the end of the loop
	
loop_copy:
	cmp	byte [rsi + rax], 0		; if we reached the \0 of src
	je	end_loop				; we jump to the end of the loop
	mov	bl, byte [rsi + rax]	; copy 1 char of src in bl
	mov	byte [rdi + rax], bl	; copy the char contained in bl to dst at the correct index
	inc	rax						; increment rax by 1 <=> increment index by 1
	jmp	loop_copy
	
end_loop:
	mov	bl, byte [rsi + rax]	; copy \0 of src in bl
	mov	byte [rdi + rax], bl	; copy \0 from bl to dst
	lea	rax, [rdi]				; loading effective address of dest in rax for returning it
	ret
