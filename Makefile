all: src/tasks.c
	gcc src/tasks.c -o bin/tasks.exe
clean:
	rm -rf bin/*.exe bin/*.o
run: all
	./bin/tasks.exe
