#include <stdio.h>
#include <math.h>

#include <stdio.h>
#include <stdlib.h>
#include<klee/klee.h>
#include<assert.h>
// program racuna |x-3|+|x -1| -6 

int solve(int x){
	
	if( x> 3)
		if(x-1 > 0)
			return   2*x-10;
 		else
 		  return -8;
	else
		if( x -1>0)
			return  -4;
		else 
			return -2*x-2;	
			
	return x;				
}

int main(int argc, char** argv){
	int x;

	printf("Enter parameter: ");
  	klee_make_symbolic(&x,sizeof(int),"x");
	int no = solve(x);

	if(no == 0) {
		printf("That's the solution : x = %d\n",x);
    		klee_assert(0);	
    		}
  else{
		printf("Not a solution!\n");
	}
		
	return no;
}
