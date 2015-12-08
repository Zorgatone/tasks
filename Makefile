NAME= tasks
BIN= bin
SRC= src
EXE:= $(BIN)/$(NAME)

#RM= rm -rf
#CC= gcc

OBJS:= $(BIN)/*.o

WARNINGS= -Wall -Wextra -pedantic
DEBUG= -O0 -DDEBUG -g3 -gdwarf-2
FLAGS= -std=c11 $(WARNINGS) $(DEBUG)

all: $(EXE)
$(EXE): $(OBJS)
	$(CC) $(FLAGS) $(OBJS) -o $(EXE)

$(BIN)/main.o: $(SRC)/main.c
	$(CC) $(FLAGS) -c $(SRC)/main.c -o $(BIN)/main.o

$(BIN)/util.o: $(SRC)/util/util.c
	$(CC) $(FLAGS) -c $(SRC)/util/util.c -o $(BIN)/util.o

$(BIN)/menu.o: $(SRC)/menu/menu.c
	$(CC) $(FLAGS) -c $(SRC)/menu/menu.c -o $(BIN)/menu.o

.PHONY: clean
clean:
	$(RM) $(EXE) $(BIN)/*.o

.PHONY: run
run: $(EXE)
	$(EXE) $(ARGS)
