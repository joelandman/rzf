#include <stdio.h>
#include <math.h>

double zeta(long N, long a) {
        double  s=0.0;
        long i;
        for(i=N;i>=1;i--) {
                s += pow(1.0/(double)i,a);
        }
        return s;
}


int main()
{
 long N = 16000000000 ;
 double pi = 3.1415926535897;
 double pi_squared_over_6 = pi*pi / 6.0;
 double  zeta_2 = zeta(N,2l);
 
 printf("   zeta(2) = %18.16f\n", zeta_2);
 printf("pi^2 / 6.0 = %18.16f\n", pi_squared_over_6);
 printf("     error = %18.16f\n", pi_squared_over_6 - zeta_2);
}

