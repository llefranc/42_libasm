	default rel
	global	_ft_strlen

	section .text
	
	; int	ft_strlen(char *str);
_ft_strlen:
	xor	rax, rax				; put rax to zero
	mov	bl, byte [rdi]
	
loop_len:
	cmp	bl, 0					; see if the char that contains bl is \0
	je	end_loop				; jump to the end of the loop label
	
onemoreletter:
	inc	rax						; we increment rax by 1
	mov	bl, byte [rdi + rax]	; putting next char in bl
	jmp	loop_len

end_loop:
	ret							; we return rax
	