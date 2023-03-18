#include <stdio.h>
#include <stdlib.h>

void
odd(int n) {
  puts("along");
}

void
even(int n) {
  puts("pair");
}

int
main(int argc, char** argv) {
  if (argc < 2) {
    exit(-1);
  }
  int num = atoi(argv[1]);
  if (num % 2) {
    odd(num);
  } else {
    even(num);
  }

  return 0;
}
