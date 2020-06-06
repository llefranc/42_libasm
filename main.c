/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lucaslefrancq <lucaslefrancq@student.42    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/05/05 12:35:43 by lucaslefran       #+#    #+#             */
/*   Updated: 2020/06/06 12:14:35 by lucaslefran      ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>

typedef struct		s_list
{
	void			*data;
	struct s_list	*next;
}					t_list;

// -------- BASIC FUNCS --------
int		ft_strlen(char *str);
char	*ft_strcpy(char * dst, const char * src);
int		ft_strcmp(const char *s1, const char *s2);
ssize_t	ft_write(int fildes, const void *buf, size_t nbyte);
ssize_t	ft_read(int fildes, void *buf, size_t nbyte);
char	*ft_strdup(const char *s1);

// -------- BONUS FUNCS --------
int		ft_atoi_base(char *str, char *base);
t_list	*ft_create_elem(void *data);
void	ft_list_push_front(t_list **begin_list, void *data);
int 	ft_list_size(t_list *begin_list);
void 	ft_list_sort(t_list **begin_list, int (*cmp)());
void	ft_list_remove_if(t_list **begin_list, void *data_ref, 
				int (*cmp)(), void (*free_fct)(void *));

t_list	*ft_create_elem(void *data)
{
	t_list *elem;

	if (!(elem = malloc(sizeof(*elem))))
		return (NULL);
	elem->data = ft_strdup(data);
	elem->next = NULL;
	return (elem);
}

void	free_function(void *ptr)
{
	free(ptr);
}

int		main(int ac, char **av)
{
	(void)ac;
	(void)av;
	//-------ft_strlen-------
	// printf("len str = %d\n", ft_strlen(av[1]));
	
	//-------ft_strcpy-------
	// printf("-------MINE-------\n");
	// printf("AVANT dest = |%s|\n", av[1]);
	// printf("AVANT src = |%s|\n", av[2]);
	// printf("retour strcpy = |%s|\n", ft_strcpy(av[1], av[2]));
	// printf("APRES dest = |%s|\n", av[1]);
	// printf("APRES src = |%s|\n", av[2]);
	// printf("-------TRUE-------\n");
	// printf("AVANT dest = |%s|\n", av[1]);
	// printf("AVANT src = |%s|\n", av[2]);
	// printf("retour strcpy = |%s|\n", strcpy(av[1], av[2]));
	// printf("APRES dest = |%s|\n", av[1]);
	// printf("APRES src = |%s|\n", av[2]);

	//-------ft_strcmp-------
	// printf("MINE : %d\n", ft_strcmp(av[1], av[2]));
	// printf("TRUE : %d\n", strcmp(av[1], av[2]));

	//-------ft_write-------
	// printf("MINE : %zd\n", ft_write(-1, av[1], strlen(av[1])));
	// printf("TRUE : %zd\n", write(-1, av[1], strlen(av[1])));
	// printf("errno = %d\n", errno);

	//-------ft_read-------
	// int fd;
	// char buffer[10] = {'\0'};

	// fd = open("test.txt", O_RDONLY);
	// printf("mine ret = %zd\n", ft_read(fd, NULL, atoi(av[1])));
	// printf("mine = |%s|\n", buffer);
	// printf("mine errno = %d\n", errno);
	// printf("true ret = %zd\n", read(fd, NULL, atoi(av[1])));
	// printf("true = |%s|\n", buffer);
	// printf("true errno = %d\n", errno);

	//-------ft_strdup-------
	// char *str_malloc;
	
	// str_malloc = ft_strdup(av[1]);
	// printf("mine = |%s|\n", str_malloc);
	// free(str_malloc);
	// str_malloc = strdup(av[1]);
	// printf("true = |%s|\n", str_malloc);
	// free(str_malloc);

	//-------ft_atoi_base-------
	// printf("%d\n", ft_atoi_base(av[1], av[2]));

	// LIST FUNCTIONS
	t_list *elem1 = ft_create_elem("str4\n");
	t_list *elem2 = ft_create_elem("str2\n");
	t_list *elem3 = ft_create_elem("str3\n");
	t_list *elem4 = ft_create_elem("str3\n");
	t_list *elem5 = ft_create_elem("str5\n");
	t_list *elem6 = ft_create_elem("str0\n");
	t_list *first;

	first = elem1;
	elem1->next = elem2;
	elem2->next = elem3;
	elem3->next = elem4;
	elem4->next = elem5;
	elem5->next = elem6;
	elem6->next = NULL;

	
	//-------ft_list_push_front-------
	// ft_list_push_front(&first, "salut\n");
	// while (first)
	// {
	// 	printf("%s", first->data);
	// 	first = first->next;
	// }
	
	//-------ft_list_size-------
	// printf("list size = %d\n", ft_list_size(first));

	// -------ft_list_sort-------
	// ft_list_sort(&first, &ft_strcmp);
	// while (first)
	// {
	// 	printf("%s", first->data);
	// 	first = first->next;
	// }

	//-------ft_list_remove_if-------
	// ft_list_remove_if(&first, "str4\n", &ft_strcmp, &free_function);
	// while (first)
	// {
	// 	printf("%s", first->data);
	// 	first = first->next;
	// }

    free(elem1);
    free(elem2);
    free(elem3);
    free(elem4);
    free(elem5);
    free(elem6);
    
	return (0);
}
