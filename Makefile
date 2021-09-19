##
## EPITECH PROJECT, 2020
## EPITECH 2020
## File description:
## Makefile for assembly project
##

SRC	=	source/memcpy.asm \
		source/memset.asm \
		source/strchr.asm \
		source/strcmp.asm \
		source/strlen.asm \
		source/memmove.asm \

AS	=	nasm

CC	=	gcc

OBJ	=	$(SRC:.asm=.o)

ASFLAGS	=	-f elf64 -Wall -Ox

NAME	=	libasm.so

all:	$(NAME)

$(NAME): $(OBJ)
	$(CC) -nostdlib -shared -fPIC $(OBJ) -o $(NAME)

%.o : %.asm
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME) $(OBJ) *~

re:		fclean all

.PHONY: all clean fclean re
