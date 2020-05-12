	default	rel
	global	_ft_strcmp

	section .text

	; int	ft_strcmp(const char *s1, const char *s2);
_ft_strcmp:
	xor	rax, rax				; setting rax to 0
	
loop_cmp:
	movzx rbx, byte [rdi + rax]	; move 1 byte (s1[rax]) into rbx and fill the bits to the left with zero
	cmp	bl, byte [rsi + rax]	; comp s1[i] && s2[i]
	jne	end_loop				; if s1[i] != s2[i] we exit the loop
	cmp	bl, 0					; check if s1[i] == '\0'. If yes, means also s2[i] == '\0' so we exit the loop
	jz	end_loop				; if dst[i] == '\0' && src[i] == '\0' we exit the loop
	inc rax
	jmp	loop_cmp				; we loop until s1[i] != s2[i]
	
end_loop:
	movzx rcx, byte [rsi + rax]	; move 1 byte (s2[rax]) into rbx and fill the bits to the left with zero
	sub rbx, rcx				; substraction on 2 longs
	mov rax, rbx				; moving the return value in rax
	ret;
