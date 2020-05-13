# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lucaslefrancq <lucaslefrancq@student.42    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/12 07:44:43 by lucaslefran       #+#    #+#              #
#    Updated: 2020/05/13 18:43:25 by lucaslefran      ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	libasm.a
CC			=	gcc
FLAGS		=	-Wall -Werror -Wextra
NASM		=	nasm -f macho64

SRCS_ASM	=	ft_read.s ft_strcmp.s ft_strcpy.s ft_strdup.s ft_strlen.s \
				ft_write.s
SRCS_BONUS	=	ft_atoi_base.s ft_list_push_front.s ft_list_remove_if.s \
				ft_list_size.s ft_list_sort.s
PATH_ASM	=	srcs_asm/
PATH_BONUS	=	srcs_asm_bonus/
OBJS_ASM	=	$(addprefix $(PATH_ASM), $(SRCS_ASM:.s=.o))
OBJS_BONUS	=	$(addprefix $(PATH_BONUS), $(SRCS_BONUS:.s=.o))
				
all			:		$(NAME)

bonus		:		$(NAME)

$(NAME)		:		$(OBJS_ASM) $(OBJS_BONUS)
					ar rc $(NAME) $(OBJS_ASM) $(OBJS_BONUS)
					ranlib $(NAME)
%.o: %.s	
				 	$(NASM) -o $@ $<

clean		:
					rm -rf $(OBJS_ASM) $(OBJS_BONUS)

fclean		:	clean
					rm -rf $(NAME)

re			:	fclean all

.PHONY		:	all bonus clean fclean re
