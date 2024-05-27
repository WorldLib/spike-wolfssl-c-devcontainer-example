#include <stdio.h>
#include <wolfssl/test.h>

int main(int argc, char const *argv[])
{
  printf("Hello, World!\n");
  #ifdef wolfSSL_TEST_H
    printf("wolfSSL_TEST_H defined\n");
  #endif
  return 0;
}
