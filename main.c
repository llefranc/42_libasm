/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lucaslefrancq <lucaslefrancq@student.42    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/05/05 12:35:43 by lucaslefran       #+#    #+#             */
/*   Updated: 2020/05/08 10:46:06 by lucaslefran      ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>

int		ft_strlen(char *str);
char	*ft_strcpy(char * dst, const char * src);
int		ft_strcmp(const char *s1, const char *s2);
ssize_t	ft_write(int fildes, const void *buf, size_t nbyte);
ssize_t	ft_read(int fildes, void *buf, size_t nbyte);
char	*ft_strdup(const char *s1);
int		ft_atoi_base(char *str, char *base);

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
	
	return (0);
}
