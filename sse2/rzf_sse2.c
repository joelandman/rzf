#include <stdio.h>
#include <math.h>
#include <sys/timeb.h>
#include <time.h>
#include <stdlib.h>

#include <unistd.h>
#include "string.h"

#include <emmintrin.h>

typedef __m128d vFloat;

#define NUMBER_OF_CALIPER_POINTS 10
#define VLEN 2

struct timeb t_initial,t_final,caliper[NUMBER_OF_CALIPER_POINTS];

int main(int argc, char **argv)
  {
    int i,j,k,milestone,n,rc;
    int NMAX=5000000, MMAX=10,m;
    double *array,total,sum,delta_t,pi, pi_exact, decrement[VLEN];
    double zero=0.0, one=1.0;
    double l[VLEN];
    double d_n[VLEN];
    double d_pow[VLEN];
    double p_sum[VLEN];
    
    __m128d  __D_POW;
    __m128d  __D_N;
    
    int true = (1==1), false = (1==0),inf=0 ;
    int name_length=0, start_index, end_index, unroll=VLEN;
    char *cpu_name,c; 

    milestone	= 0;
    n		= 0;
    sum		= zero;
    pi_exact	= 4.0*atan(1.0);
    
    rc=ftime(&caliper[milestone]);

    /*
       Riemann zeta function of integer argument
       (c.f. http://mathworld.wolfram.com/RiemannZetaFunction.html )
       
       zeta(n) = sum[k=1;k<=inf;k++] (1.0/pow(k,n))
    
                  inf 
                  ----
                  \        1
       zeta(n) =   >       -
                  /         n
		  ----     k
                  k=1
    

	this code will compute zeta(2) in order to calculate
	pi.  pi*pi/6 = zeta(2), so pi = sqrt(6*zeta(2))

	to run this code, type

		./rzf.exe -l INFINITY -n n

	where INFINITY is an integer value of how many terms you would 
	like to take for your sum, and n is the argument to the Reimann
	zeta function.  If you use 2 for n, then it will calculate pi 
	for you as well.

     */
    
       printf("D: checking arguments: N_args=%i \n",argc);
       for(i=0;i<argc;i++)
          {
	    printf("D: arg[%i] = %s\n",i,argv[i]);
            if (strncmp(argv[i],"-n",2)==0)
               {
		n = atoi(argv[i+1]);
 		printf("D: N found to be = %i\n",n);
		printf("D: should be %s\n",argv[i+1]);	
               }
            if (strncmp(argv[i],"-l",2)==0)
               {
		inf = atoi(argv[i+1]);
 		printf("D: infinity found to be = %i\n",n);
		printf("D: should be %s\n",argv[i+1]);
               }
          }

    sum=0.0;
    cpu_name	= (char *)calloc(80,sizeof(char));
    gethostname(cpu_name,80);
    printf("D: running on machine = %s\n",cpu_name);
   
    milestone++;
    rc=ftime(&caliper[milestone]);
    
    /* compute start_index and end_index point */
    
    start_index = inf - (inf % unroll);
    end_index = unroll;
    printf("D: start_index = %i\n",start_index);
    printf("D: end_index   = %i\n",end_index);
    printf("D: unroll      = %i\n",unroll);
    printf("D: inf-1       = %i\n",inf-1);
    
    
    /* prepare decrement, start, and exponents variable */
    for(k=0;k<VLEN;k++)
     {
      decrement[k]	= (double)VLEN;
      p_sum[k]		= 0.0;
      l[k]		= (double)(inf - 1 - k);
     }
    sum	= 0.0;
    
    /* pre-vector loop */
    for(k=inf-1;k>start_index;k--)
     {
      sum += one/pow((double)k,(double)n);
     }
    
    __m128d __P_SUM = _mm_set_pd1(0.0);        // __P_SUM[0 ... VLEN] = 0
    __m128d __ONE = _mm_set_pd1(1.);   // __ONE[0 ... VLEN] = 1
    __m128d __DEC = _mm_set_pd1((double)VLEN);
    __m128d __L	  = _mm_load_pd(l);

    for(k=start_index;k>end_index;k-=unroll)
       {
          __D_POW	= __L;	    
	  	  	  
	  for (m=n;m>1;m--)
	   {
	     __D_POW 	= _mm_mul_pd(__D_POW, __L);
	   }
	  
	  __P_SUM	= _mm_add_pd(__P_SUM, _mm_div_pd(__ONE, __D_POW));
	  
	  __L 		= _mm_sub_pd(__L, __DEC);
	  
      }
    
    _mm_store_pd(p_sum,__P_SUM);
      
    for(k=0;k<VLEN;k++)
     {  
       sum += p_sum[k];
     }
     
    /* post-vector loop */
    for(k=end_index-1;k>=1;k--)
     {
      sum += one/pow((double)k,(double)n);
     }



    milestone++;
    rc=ftime(&caliper[milestone]);

    printf("zeta(%i)  = %-.15f \n",n,sum);
    if (n == 2)
     {
       pi = sqrt(sum*6.0);
       printf("pi = %-.15f \n",pi);
    
       printf("error in pi = %-.15f \n",pi_exact-pi);
       printf("relative error in pi = %-.15f \n",(pi_exact-pi)/pi_exact);
     }
   
    
    /* now report the milestone time differences */
    for (i=0;i<=(milestone-1);i++)
       {
         delta_t = (double)(caliper[i+1].time-caliper[i].time);
         delta_t += (double)(caliper[i+1].millitm-caliper[i].millitm)/1000.0;
	 printf("Milestone %i to %i: time = %-.3fs\n",i,i+1,delta_t);
       }
   

  }
