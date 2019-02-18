CC = g++ -O3

all:	walksat makewff makequeens

walksat: walksat.cpp walksat.h walksat_main.cpp
	$(CC)  -c walksat.cpp
	$(CC)  -c walksat_main.cpp
	# If linking fails, then try adding Windows Winmm.lib
	$(CC) walksat.o walksat_main.o -lm -static -o walksat || $(CC) walksat_main.o walksat.o -lm -lWinmm -o walksat
	strip walksat

makewff: makewff.c
	$(CC)  makewff.c -lm -o makewff

makequeens: makequeens.c
	$(CC)  makequeens.c -lm -o makequeens

install: walksat makewff makequeens
	cp walksat $(HOME)/bin/
	cp makewff $(HOME)/bin/
	cp makequeens $(HOME)/bin/
	cp Scripts/* $(HOME)/bin/
	

clean:
	rm -f walksat makewff makequeens walksat.o

