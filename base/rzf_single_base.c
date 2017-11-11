#include <stdio.h>
#include <math.h>

void main()
{
 float x=0.0, y=0.0, one=1.0;
 int i,N;

 N = 100000000;

 for(i=1;i<=N;i++)
   {
     x += powf((float)i,-2.0);
   }

 for(i=N;i>=1;i--)
   {
     y += powf((float)i,-2.0);
   }

 printf("[index increasing] sum = %10.7f\n",x);
 printf("[index decreasing] sum = %10.7f\n",y);
}
