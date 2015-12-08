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

$(BIN)/%.o: $(SRC)/%.c
	$(CC) $(FLAGS) -c $(SRC)/%.c -o $(BIN)/%.o

.PHONY: clean
clean:
	$(RM) $(EXE) $(BIN)/*.o

.PHONY: run
run: $(EXE)
	$(EXE) $(ARGS)
