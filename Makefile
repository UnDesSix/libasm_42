CC			= clang -Wall -Wextra -Werror
RM			= rm -rf
LIB			= libasm.a
NASM		= nasm
NFLAGS		= -f elf64
TEST_FILE	= test/main.c
TEST_OUT	= a.out
INCS_DIR	= includes/

SRCS		= $(addprefix srcs/,\
			ft_strlen.s\
			ft_strcpy.s)

OBJS		= $(SRCS:.s=.o)

%.o			: %.s
			@$(NASM) $(NFLAGS) -I$(INCS_DIR) $< -o $@

all			: $(LIB)

$(LIB)		: $(OBJS) $(BONUS_OBJS)
			@ar rcs $(LIB) $(OBJS) $(BONUS_OBJS)

clean:
			@$(RM) $(OBJS)

fclean		: clean
			@$(RM) $(NAME) $(LIB) $(TEST_OUT)

test		: re $(TEST_FILE) $(LIB)
			@$(CC) $(TEST_FILE) $(LIB) -I$(INCS_DIR) -o $(TEST_OUT)

re			: fclean all

.PHONY		: all clean fclean re test
