#include <stdio.h>
#include <stdlib.h>
#include "mymath.h"

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

  int r = fibo(num);
  printf("fibo: %d\n", r);
  return 0;
}
