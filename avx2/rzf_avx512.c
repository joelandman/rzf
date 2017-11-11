#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <unistd.h>

#include <immintrin.h>

typedef double v4dd __attribute__ ((vector_size (64)));

void main()
  {
    int i,N=1000000000,j,k,VLEN=8,m;
    int name_length=0, start_index, end_index, unroll=VLEN, inf=N;
    double sum=0.0;

    v4dd  __D_POW ;
    v4dd  __D_N   ;

    /* compute start_index and end_index point */
    start_index = N - (N % unroll);
    end_index = unroll;

    /* pre-vector loop */
    for(k=inf-1;k>start_index;k--) {
       sum += pow(1.0/(double)k,2.0);
    }

    // __P_SUM[0 ... VLEN] = 0 */
    v4dd __P_SUM   = {0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0};

     // __ONE[0 ... VLEN] = 1
    v4dd __ONE     = {1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0};

    v4dd __inc     = {(double)VLEN,(double)VLEN,(double)VLEN,(double)VLEN,
                      (double)VLEN,(double)VLEN,(double)VLEN,(double)VLEN};

    // __DEC[0 ... VLEN] = VLEN
    v4dd __DEC  = __inc, __L , __INV  ;

    for(k=0;k<VLEN;k++) {
       __L[k]		= (double)(inf - 1 - k);
    }

  	for (k=start_index; k > end_index ; k -= unroll ) {
        __D_POW 	    =   __L * __L;
        __L 			    -=  __DEC;
        __INV		      =   __ONE / __D_POW;
        __P_SUM	   	  +=  __INV;
    }

    /* reduce partial sums to final sum */
    for(k=0;k<VLEN;k++) {
       sum += __P_SUM[k];
    }

    /* post-vector loop index cleanup, serial section */
    for(k=end_index-1;k>=1;k--) {
       sum += pow(1.0/(double)k,2.0);
    }

    printf("zeta(%i)  = %18.16f \n",2,sum);
  }
