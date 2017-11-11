#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <unistd.h>

#include <immintrin.h>

//typedef __m256d vFloat;

void main()
  {
    int i,N=1000000000,j,k,VLEN=4,m;
    double *array,total,sum, decrement[VLEN];
    double __zero[] = {0.0, 0.0, 0.0, 0.0};
    double __one[]  = {1.0, 1.0, 1.0, 1.0};
    double __inc[]  = {(double)VLEN,(double)VLEN,(double)VLEN,(double)VLEN};
    double l[VLEN];
    double d_n[VLEN];
    double d_pow[VLEN];
    double p_sum[VLEN];

    __m256d  __D_POW ;
    __m256d  __D_N   ;

    int name_length=0, start_index, end_index, unroll=VLEN, inf=N;
    char *cpu_name,c;

    sum		= 0.0;

    /* compute start_index and end_index point */

    start_index = N - (N % unroll);
    end_index = unroll;

    /* prepare decrement, start, and exponents variable */
    for(k=0;k<VLEN;k++) {
       p_sum[k]		= 0.0;
       l[k]		= (double)(inf - 1 - k);
    }

    /* pre-vector loop */
    for(k=inf-1;k>start_index;k--) {
       sum += pow(1.0/(double)k,2.0);
    }

    // __P_SUM[0 ... VLEN] = 0 */
    __m256d __P_SUM   = _mm256_broadcast_sd(__zero);

     // __ONE[0 ... VLEN] = 1
    __m256d __ONE     = _mm256_broadcast_sd(__one);

    // __DEC[0 ... VLEN] = VLEN
    __m256d __DEC  = _mm256_broadcast_sd(__inc);
    __m256d __L    = _mm256_load_pd(l);
    __m256d __INV  ;


  	for (k=start_index; k > end_index ; k -= unroll ) {
        __D_POW 	    = _mm256_mul_pd(__L, __L);
        __L 			    = _mm256_sub_pd(__L, __DEC);
        __INV		      = _mm256_div_pd(__ONE, __D_POW);
        __P_SUM	   	  = _mm256_add_pd(__P_SUM, __INV);

    }

    _mm256_store_pd(p_sum,__P_SUM);

    /* reduce partial sums to final sum */
    for(k=0;k<VLEN;k++) {
       sum += p_sum[k];
    }

    /* post-vector loop index cleanup, serial section */
    for(k=end_index-1;k>=1;k--) {
       sum += pow(1.0/(double)k,2.0);
    }

    printf("zeta(%i)  = %18.16f \n",2,sum);

  }
