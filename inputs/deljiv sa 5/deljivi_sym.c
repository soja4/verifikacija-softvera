#include <stdio.h>
#include <assert.h>
#include <klee/klee.h>

int ostatak_sa_5(int x) {
  if(x%5 == 0)
    return 0;
  
  if(x%5 == 1 || x%5 == 3)
    return 1;
	
	if(x%5 == 2 || x%5 == 4)
    return 2;

  klee_assert(0);
  return 1; // nedostizna naredba
}

int main(int argc, char* argv[]) {
  int x;

  klee_make_symbolic(&x, sizeof(int),"x");

  return ostatak_sa_5(x);
}

