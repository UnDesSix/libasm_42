#include <stdio.h>
#include <unistd.h>
#include <string.h>

int		ft_strlen(char *str);
char	*ft_strcpy(char *dst, char *src);
int		ft_strcmp(char *src1, char *src2);
ssize_t	ft_write(int fd, const void *buf, size_t count);


int main(void)
{
	char	src[] = "Hello World!"; // strlen : 12
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
	printf("MINE : %d\n", ft_write(1, src, ft_strlen(src)));
	printf("REAL : %d\n", write(1, src, strlen(src)));
	return (0);
}
