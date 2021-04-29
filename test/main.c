#include <stdio.h>
#include <string.h>

int		ft_strlen(char *str);
char	*ft_strcpy(char *dst, char *src);
int		ft_strcmp(char *src1, char *src2);

int main(void)
{
	char	src[] = "Jean-Baptiste";
	char	src1[] = "Matt";
	char	src2[] = "Matthieu";
//	char	src3[] = "";
//	char	*src0 = NULL;
	char	dst[14];
	int		len = 0;

	len = ft_strlen(src);
	printf("//Test 1//\n");
	printf("Lenght of \"%s\" is %d\n", src, len);

	ft_strcpy(dst, src);
	printf("//Test 2//\n");
	printf("Copy of \"%s\" is \"%s\"\n", src, dst);

	printf("MINE : %d\n", ft_strcmp("A", "C"));
	printf("REAL : %d\n", strcmp("A", "C"));
	printf("MINE : %d\n", ft_strcmp("\30", "\100"));
	printf("REAL : %d\n", strcmp("\30", "\100"));
	printf("MINE : %d\n", ft_strcmp("\200", "\0"));
	printf("REAL : %d\n", strcmp("\200", "\0"));
	printf("MINE : %d\n", ft_strcmp(src1, src2));
	printf("REAL : %d\n", strcmp(src1, src2));
	printf("MINE : %d\n", ft_strcmp("Matt", "Matt"));
	printf("REAL : %d\n", strcmp("Matt", "Matt"));
	printf("MINE : %d\n", ft_strcmp("ab", "a"));
	printf("REAL : %d\n", strcmp("ab", "a"));
	return (0);
}
