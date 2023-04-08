CC=gcc
ENABLE_DYNAMIC_LOADING=-ldl
ENABLE_PTHREAD=-pthread
EX_LIB=$(ENABLE_DYNAMIC_LOADING) $(ENABLE_PTHREAD)
OPENSSL_INCLUDE=../../openssl/include
OPENSSL_LIB_CRYPTO=../../openssl/libcrypto.a

all: app dec enc
app: main $(OPENSSL_LIB_CRYPTO)
	$(CC) -o $@.exe -I$(OPENSSL_INCLUDE) $<.o $(OPENSSL_LIB_CRYPTO) $(EX_LIB)
enc: enc.c
	$(CC) -o $@.o -c $<
	$(CC) -o $@.exe -I{OPENSSL_INCLUDE} $@.o $(OPENSSL_LIB_CRYPTO) $(EX_LIB)
dec: dec.c
	$(CC) -o $@.o -c $<
	$(CC) -o $@.exe -I{OPENSSL_INCLUDE} $@.o $(OPENSSL_LIB_CRYPTO) $(EX_LIB)
main: main.c
	$(CC) -o $@.o -c $<
clean:
	rm $(wildcard *.o) $(wildcard *.exe) $(wildcard *.txt) $(wildcard decrypted) $(wildcard encrypted)
