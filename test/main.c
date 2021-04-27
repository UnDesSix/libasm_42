#include <stdio.h>

int		ft_strlen(char *str);
char	*ft_strcpy(char *dst, char *src);

int main(void)
{
	char	src[] = "Jean-Baptiste";
	char	dst[14];
	int		len = 0;

	len = ft_strlen(src);
	printf("//Test 1//\n");
	printf("Lenght of \"%s\" is %d\n", src, len);
	
	printf("//Test 2//\n");
	printf("Copy of \"%s\" is \"%s\"\n", src, ft_strcpy(dst, src));
	return (0);
}
