#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <errno.h>
#include <unistd.h>
#include <string.h>

int		ft_strlen(const char *str);
char	*ft_strcpy(char *dst, const char *src);
int		ft_strcmp(const char *src1, const char *src2);
ssize_t	ft_write(int fd, const void *buf, size_t count);
ssize_t	ft_read(int fd, const void *buf, size_t count);
char	*ft_strdup(const char *src);


int main(void)
{
	char	src[] = "Hello World!"; // strlen : 12
	char	buffer[100]; // of size 100
	char	dst[14];

//	char	*src0 = NULL;
	char	src1[] = "Matt";
	char	src2[] = "Matthieu";
	char	src3[] = "AA";
	char	src4[] = "AB";
	char	src5[] = "\200";
	char	src6[] = "\0";
	char	src7[] = "Matt";
	char	src8[] = "Matt";

	int		fd = 0;

	printf("//Test 1 : STRLEN//\n");
	printf("Lenght of \"%s\" is %d\n", src, ft_strlen(src));

	ft_strcpy(dst, src);
	printf("\n//Test 2 : STRCPY//\n");
	printf("Copy of \"%s\" is \"%s\"\n", src, dst);

	printf("\n//Test 3 : STRCMP//\n");
	printf("MINE : %d\n", ft_strcmp(src1, src2));
	printf("REAL : %d\n", strcmp(src1, src2));
	printf("MINE : %d\n", ft_strcmp(src3, src4));
	printf("REAL : %d\n", strcmp(src3, src4));
	printf("MINE : %d\n", ft_strcmp(src5, src6));
	printf("REAL : %d\n", strcmp(src5, src6));
	printf("MINE : %d\n", ft_strcmp(src7, src8));
	printf("REAL : %d\n", strcmp(src7, src8));

	printf("\n//Test 4 : WRITE//\n");
	printf("MINE :\n");
	printf(" with a return value of : %zd\n", ft_write(1, src, 3));
	printf(" and a errno of : %d\n", errno);
	printf("REAL :\n");
	printf(" with a return value of : %zd\n", write(1, src, 3));
	printf(" and a errno of : %d\n", errno);

	printf("\n//Test 5 : READ//\n");
	fd = open("Makefile", O_RDONLY);
	printf("MINE :\n");
	printf(" with a return value of : %zd\n", ft_read(fd, buffer, 30));
	printf(" and a errno of : %d\n", errno);
//	printf(" content : %s\n", buffer);
	printf("REAL :\n");
	printf(" with a return value of : %zd\n", read(fd, buffer, 30));
	printf(" and a errno of : %d\n", errno);
//	printf(" content : %s\n", buffer);

	printf("\n//Test 6 :STRDUP//\n");
	printf("MINE : %s\n", ft_strdup("Matt"));
	printf("REAL : %s\n", strdup("Matt"));

	return (0);
}
