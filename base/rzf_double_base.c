#include <stdio.h>
#include <math.h>

void main()
{
 double x=0.0, y=0.0, one=1.0;
 int i,N;

 N = 100000000;

 for(i=1;i<=N;i++)
   {
     x += pow((double)i,-2.0);
   }

 for(i=N;i>=1;i--)
   {
     y += pow((double)i,-2.0);
   }

 printf("[index increasing] sum = %18.16f\n",x);
 printf("[index decreasing] sum = %18.16f\n",y);
}
