NAME= tasks
SRC= src

WARNINGS= -Wall -Wextra -pedantic
DEBUGFLAGS= -O0 -DDEBUG -g3 -gdwarf-2
RELEASEFLAGS= -O3 -DNDEBUG

ifeq ($(RELEASE),1)
	FLAGS= -std=c11 $(RELEASEFLAGS)
	BIN= bin/release
else
	FLAGS= -std=c11 $(WARNINGS) $(DEBUGFLAGS)
	BIN= bin/debug
endif

EXE:= $(BIN)/$(NAME)
OBJS:= $(patsubst $(SRC)/%.c,$(BIN)/%.o,$(wildcard $(SRC)/**/*.c $(SRC)/*.c))

all: $(EXE)
$(EXE): $(OBJS)
	$(CC) $(FLAGS) $(OBJS) -o $(EXE)

$(BIN)/%.o: $(SRC)/%.c
	mkdir -p $(@D)
	$(CC) $(FLAGS) -c $^ -o $@

.PHONY: rebuild
rebuild: clean all

.PHONY: clean
clean:
	$(RM) bin/debug/$(NAME) bin/release/$(NAME)
	$(RM) bin/release/**/*.o bin/release/*.o
	$(RM) bin/debug/**/*.o bin/debug/*.o

.PHONY: run
run: $(EXE)
	@$(EXE) $(ARGS)
