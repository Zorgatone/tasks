NAME=tasks
BIN=bin
SRC=src
EXE:=$(BIN)/tasks

#RM=rm -rf
#CC=gcc

OBJS:=$(BIN)/tasks.o
FLAGS=-std=c11 -Wall -Wextra -pedantic

all: $(EXE)
$(EXE): $(OBJS)
	$(CC) $(OBJS) -o $(EXE)

$(BIN)/tasks.o: $(SRC)/tasks.c
	$(CC) $(FLAGS) -c $(SRC)/tasks.c -o $(BIN)/tasks.o

clean:
	$(RM) $(EXE) $(OBJS)

run: $(EXE)
	$(EXE)
