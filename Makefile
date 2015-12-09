NAME= tasks
BIN= bin
SRC= src
EXE:= $(BIN)/$(NAME)

#RM= rm -rf
#CC= gcc

OBJS:= $(patsubst $(SRC)/%.c,$(BIN)/%.o,$(wildcard $(SRC)/**/*.c $(SRC)/*.c))

WARNINGS= -Wall -Wextra -pedantic
DEBUG= -O0 -DDEBUG -g3 -gdwarf-2
FLAGS= -std=c11 $(WARNINGS) $(DEBUG)

all: $(EXE)
$(EXE): $(OBJS)
	$(CC) $(FLAGS) $(OBJS) -o $(EXE)

$(BIN)/%.o: $(SRC)/%.c
	mkdir -p $(@D)
	$(CC) $(FLAGS) -c $^ -o $@

.PHONY: clean
clean:
	$(RM) $(EXE) $(BIN)/**/*.o $(BIN)/*.o

.PHONY: run
run: $(EXE)
	$(EXE) $(ARGS)
