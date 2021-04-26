#include <stdio.h>

int	_ft_strlen(char *str);

int main(int argc, char **argv)
{
	int len = 0;

	if (argc != 2)
		return (0);
	len = _ft_strlen(argv[1]);
	printf("len :%d\n", len);
	return (0);
}
