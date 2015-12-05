ifeq "$(OS)" "Windows_NT"
	EXT=.exe
else
	RM=rm -rf
endif

NAME=tasks
BIN=bin
SRC=src
EXE:=./$(BIN)/tasks$(EXT)

CC=gcc

OBJS:=$(BIN)/tasks.o
FLAGS=-std=c11 -Wall -Wextra -pedantic

all: $(EXE)
$(EXE): $(OBJS)
	$(CC) $(FLAGS) $(OBJS) -o $(EXE)

$(BIN)/tasks.o: $(SRC)/tasks.c
	$(CC) -c $(SRC)/tasks.c -o $(BIN)/tasks.o

clean:
	cd bin && $(RM) $(NAME)$(EXT) *.o

run: $(EXE)
	$(EXE)
