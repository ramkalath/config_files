CC = g++

CFLAGS = -g -std=c++11 -O2 -Wall 

INCLUDE =

LIBS = 

# (TODO: enter filename without extension)
FILENAME = main

all: $(FILENAME).cpp
	@$(CC) $(CFLAGS) $(INCLUDE) $(FILENAME).cpp -o $(FILENAME) $(LIBS)

run:
	@./$(FILENAME)	

clean:
	rm ./$(FILENAME) 
