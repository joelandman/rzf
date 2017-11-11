#include <stdio.h>
#include <math.h>

int main()
{
 double  y=0.0;
 int i,N = 100000000;

  for(i=N;i>=1;i--) {
     y += pow(1.0/(double)i,2.0);
  }

 printf("[index decreasing] sum = %18.16f\n",y);
}
