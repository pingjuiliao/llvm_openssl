CC=../llvm/build/bin/clang
CXX=../llvm/build/bin/clang++
OPT=../llvm/build/bin/opt
PASS=print-function
all: a-opt0
a-opt0: a.c mymath-opt0
	$(CC) -c $< -o $@.o
	$(CC) mymath-opt0.o a-opt0.o -o $@.exe
mymath-opt0: mymath.c
	$(CC) -c $< -o $@.o 
## Remove clang default pipeline so that we have to use OPT
#a-opt: a.c
#	$(CC) -o $@.ll -O0 -m64 -emit-llvm -S $<
#	$(OPT) -o $@.bc -passes=$(PASS) $@.ll
#	$(CC) -o $@.exe $@.bc -O0
clean:
	rm $(wildcard *.bc) $(wildcard *.exe) $(wildcard *.ll) $(wildcard *.o) $(wildcard trace.txt)


