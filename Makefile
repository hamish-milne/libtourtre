CC = gcc
CPPFLAGS = -I./include
CFLAGS = -ansi -pedantic -fPIC -Wall -O2
AR = ar
ARFLAGS = -q

all : shared static

docs :
	doxygen

shared : libtourtre.so

static : libtourtre.a

libtourtre.a : src/tourtre.o src/ctArc.o src/ctBranch.o src/ctComponent.o src/ctNode.o src/ctQueue.o
	$(AR) $(ARFLAGS) libtourtre.a src/tourtre.o src/ctArc.o src/ctBranch.o src/ctComponent.o src/ctNode.o src/ctQueue.o
	
libtourtre.so : src/tourtre.o src/ctArc.o src/ctBranch.o src/ctComponent.o src/ctNode.o src/ctQueue.o
	$(CC) -shared -o libtourtre.so src/tourtre.o src/ctArc.o src/ctBranch.o src/ctComponent.o src/ctNode.o src/ctQueue.o

src/tourtre.o : src/tourtre.c include/tourtre.h src/ctMisc.h include/ctArc.h include/ctNode.h src/ctComponent.h include/ctNode.h src/ctQueue.h src/ctAlloc.h
	$(CC) $(CPPFLAGS) $(CFLAGS) -o src/tourtre.o -c src/tourtre.c

src/ctArc.o : src/ctArc.c include/tourtre.h src/ctMisc.h include/ctArc.h 
	$(CC) $(CPPFLAGS) $(CFLAGS) -o src/ctArc.o -c src/ctArc.c

src/ctBranch.o : src/ctBranch.c include/tourtre.h src/ctMisc.h include/ctBranch.h 
	$(CC) $(CPPFLAGS) $(CFLAGS) -o src/ctBranch.o -c src/ctBranch.c

src/ctComponent.o : src/ctComponent.c include/tourtre.h src/ctMisc.h src/ctComponent.h 
	$(CC) $(CPPFLAGS) $(CFLAGS) -o src/ctComponent.o -c src/ctComponent.c

src/ctNode.o : src/ctNode.c include/tourtre.h src/ctMisc.h include/ctNode.h 
	$(CC) $(CPPFLAGS) $(CFLAGS) -o src/ctNode.o -c src/ctNode.c

src/ctQueue.o : src/ctQueue.c include/tourtre.h src/ctMisc.h src/ctQueue.h 
	$(CC) $(CPPFLAGS) $(CFLAGS) -o src/ctQueue.o -c src/ctQueue.c

clean :
	-rm -rf src/*.o libtourtre.a libtourtre.so doc

	
# src/test : 	libtourtre.a test/test.c
# 	$(CC) $(CPPFLAGS) $(CFLAGS) -o test/test test/test.c -L. -ltourtre
# 
# test: src/test
# 	test/test