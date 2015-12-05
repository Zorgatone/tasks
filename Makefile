NAME=tasks
BIN=bin
SRC=src
EXE:=$(BIN)/$(NAME)

#RM=rm -rf
#CC=gcc

OBJS:=$(BIN)/$(NAME).o
FLAGS=-std=c11 -Wall -Wextra -pedantic

all: $(EXE)
$(EXE): $(OBJS)
	$(CC) $(FLAGS) $(OBJS) -o $(EXE)

$(BIN)/$(NAME).o: $(SRC)/$(NAME).c
	$(CC) $(FLAGS) -c $(SRC)/$(NAME).c -o $(BIN)/$(NAME).o

clean:
	$(RM) $(EXE) $(OBJS)

run: $(EXE)
	$(EXE)
