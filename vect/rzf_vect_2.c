#include <stdio.h>
#include <math.h>
#define unroll 4
#define N 1000000000
#define _N N-(N % unroll)

void main()
{
 double x=0.0, y=0.0, 
	one[]={1.0,1.0,1.0,1.0}, 
	psum[]={0.0,0.0,0.0,0.0}, 
	_i[]={_N,_N-1,_N-2,_N-3};
 int i,j;

 
 /* pre-loop */
 for(i=N;i>_N;i--) { y += 1.0/pow((double)i,2.0);  }

 /* main */
 for(i=_N;i>2*unroll;i-=unroll)
   {
     /* pretend this is a dot product ... see if the compiler will fall for it */
     
     y += (one[0]/_i[0])*(one[0]/_i[0]) +
	  (one[1]/_i[1])*(one[1]/_i[1]) +
          (one[2]/_i[2])*(one[2]/_i[2]) +
          (one[3]/_i[3])*(one[3]/_i[3]);
     for(j=0;j<unroll;j++) _i[j]-=unroll;
   }
  
 /* post-loop */
 for(i=2*unroll;i>=1;i--) { y += 1.0/pow((double)i,2.0);  }

 printf("[index decreasing] sum = %18.16f\n",y);
}
