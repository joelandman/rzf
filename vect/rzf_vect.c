#include <stdio.h>
#include <math.h>

void main()
{
 int unroll = 4;
 double x=0.0, y=0.0, one[]={1.0,1.0,1.0,1.0}, psum[]={0.0,0.0,0.0,0.0};
 int i,N,_N;

 N = 100000000;
 _N = N-(N % unroll) ;
 
 /* pre-loop */
 for(i=N;i>_N;i--) { y += 1.0/pow((double)i,2.0);  }

 /* main */
 for(i=_N;i>2*unroll;i-=unroll)
   {
     /* pretend this is a dot product ... see if the compiler will fall for it */
     y += one[0]/pow((double)i,2.0) +
	  one[1]/pow((double)i-1.0,2.0) +
	  one[2]/pow((double)i-2.0,2.0) +
	  one[3]/pow((double)i-3.0,2.0);
   }
  
 /* post-loop */
 for(i=2*unroll;i>=1;i--) { y += 1.0/pow((double)i,2.0);  }

 printf("[index decreasing] sum = %18.16f\n",y);
}
