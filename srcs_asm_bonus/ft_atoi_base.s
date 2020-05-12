	default rel
	global	_ft_atoi_base

	section .text
	
	; int	ft_atoi_base(char *str, char *base);
_ft_atoi_base:
	cmp rdi, 0
	je end_error						; if str_nb is NULL >> error
	cmp rsi, 0
	je end_error						; if base is NULL >> error
	mov r11, -1
	
	; ----- CHECK LEN STR BASE >= 2 AND NON AUTHORIZED CHAR (+,-,whitespaces) -----
loop_base_len:
	inc r11
	cmp byte [rsi + r11], 32			; space in base >> error
	je end_error
	cmp byte [rsi + r11], 43			; '+' in base >> error
	je end_error
	cmp byte [rsi + r11], 45			; '-' in base >> error
	je end_error
	cmp byte [rsi + r11], 9				; if ascii value less than whitespaces (wp : from 9 to 13)
	jl base_len_cmp
	cmp byte [rsi + r11], 13			; if greater than whitepaces (wp : from 9 to 13)
	jg base_len_cmp
	jmp end_error						; if we reach this instruction, base[x] is >= 9 && <= 13 >> error

base_len_cmp:
	cmp byte [rsi + r11], 0				; incrementing index until we met base '\0'
	jne loop_base_len					; if not '\0', we jump abive to check next char
	cmp r11, 2
	jl end_error						; if len base == 0 or == 1, error

	; ----- CHECK NO CHAR 2 TIMES IN STR_BASE -----
	mov rbx, -1							; setting our future index (x = -1)
loop_no_double_char:
	inc rbx								; incrementing x
	mov al, byte [rsi + rbx]			; saving base[x] in al for future comp
	cmp al, 0
	je char_strnb_in_strbase			; if base[x] == '\0', we have checked all str_base
	mov rcx, rbx						; y = x + 1
	
loop_cmp_double_char:
	inc rcx								; we loop to check each char after base[x]
	cmp al, byte [rsi + rcx]			; if base[x] == base[y] >> error
	je end_error
	cmp byte [rsi + rcx], 0
	jne loop_cmp_double_char			; if base[y] != '\0', inc y by 1 and check next char
	jmp loop_no_double_char				; otherwise base[y] == '\0', inc x by 1 and restart the process

	; ----- CHECK EACH CHAR OF STR_NB ARE IN STR_BASE -----
char_strnb_in_strbase:
	mov rbx, -1
	
loop_char_strnb_in_strbase:
	inc rbx								; nb[x], incrementing x index
	mov al, byte [rdi + rbx]
	cmp al, 0
	je convert_to_int					; if we reach the end of nb, we continue and go convert the string
	xor rcx, rcx						; base[y], y = 0

loop_same_char_in_2_str:
	cmp byte [rsi + rcx], 0
	je end_error						; reach end of str_base so means nb[x] is not in base >> error
	cmp al, byte [rsi + rcx]
	je loop_char_strnb_in_strbase		; nb[x] = base[y], jumping above to add 1 to x index and restart the process
	inc rcx								; incrementing x index
	jmp loop_same_char_in_2_str			; checking next char in base

	; rdi = str_nb
	; rsi = base
	; r11 = base_len 
	; ----- CONVERT STR_NB INTO INT WITH STR_BASE -----
convert_to_int:
	xor rax, rax
	mov rbx, -1

convert_to_int_one_char:
	inc rbx								; increasing x index (base[x])
	cmp byte [rdi + rbx], 0				; if we reach end of nb_str we ret eax
	je end
	mov rcx, -1
	
loop_one_char:
	inc rcx								; increasing y index (base[y])
	mov r8b, byte [rdi + rbx]			; moving nb[x] in r8b
	cmp r8b, byte [rsi + rcx]			; nb[x] == base[y] ?
	jne loop_one_char

	mul r11d							; unsigned mult between eax that stores the number and base len in r11d
	add eax, ecx
	jmp convert_to_int_one_char			; loop and do this for every char in nb_str
	
end:
	ret

end_error:
	mov rax, 0							; when error occured, return 0
	ret
