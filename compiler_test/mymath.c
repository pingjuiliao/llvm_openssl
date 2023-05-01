#include <stdio.h>
#include <unistd.h>

int
fibo(int n) {
  if (n >= 100) {
    puts("too big for this fibonacci implementation");
    return 0;
  }
  if (n <= 1) {
    return 1;
  }
  return fibo(n-1) + fibo(n-2);
}
