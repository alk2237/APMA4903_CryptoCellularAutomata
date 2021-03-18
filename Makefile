# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fhenrion <fhenrion@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/12/07 11:40:22 by fhenrion          #+#    #+#              #
#    Updated: 2021/03/18 15:31:53 by fhenrion         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = ca256

SRC_NAME = ca256 sha256 progress_bar args
SRC = $(addsuffix .c,$(SRC_NAME))
SRC_O = $(addsuffix .o,$(SRC_NAME))

CC = gcc
CFLAGS = -Werror -Wall -Wextra

.PHONY: clean fclean all re bonus

all: $(NAME)

emulator: CAemulator.o
	$(CC) $(CFLAGS) -I. $^ -o $@
	@echo "\033[0;32mCompilation OK\033[0m"

$(NAME): $(SRC_O)
	$(CC) $(CFLAGS) -I. $^ -o $@
	@echo "\033[0;32mCompilation OK\033[0m"

%.o : %.c
	$(CC) -c $(CFLAGS) -I. $< -o $@

clean:
	@/bin/rm -f $(SRC_O) CAemulator.o
	@echo "\033[0;32mObjects files cleaning OK\033[0m"

fclean: clean
	@/bin/rm -f $(NAME) emulator
	@echo "\033[0;32mLibrary cleaning OK\033[0m"

re: fclean $(NAME)
