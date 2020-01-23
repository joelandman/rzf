#include <stdio.h>
#include <stdint.h>
#include <math.h>
#include <unistd.h>
#include <stdlib.h>
#include <cuda.h>
#include <ctime>
#include <iostream>


// timing of functions
clock_t start,end;


/* invert and square every element of the input array in parallel */
__global__ void _innergpu_2_sqr(double *psum,int64_t panel)
{
    int64_t globalIdx;
    globalIdx = (panel - 1) * blockDim.x*blockDim.x +
        blockIdx.x * blockDim.x + threadIdx.x + 1;
    int ndx = threadIdx.x;
    double  r = 1.0/(double)globalIdx;
    double r2 = r*r;
    atomicAdd(&psum[ndx],r2);
}

int main()
{

    //int64_t   N = 16000000000;
    int64_t   N = 160000;
    //int Nthr=1024;
    int i , Nthr=1024;
    int64_t Nblocks,Npanels, j;

    double sum = 0.0;
    int64_t _N;

    _N = N - (N %  Nthr);
    Npanels = 1;
    Nblocks = (int64_t)ceil((double)_N/(double)Nthr);
    if (Nblocks > Nthr*Nthr) {
        Nblocks = Nthr*Nthr;
        Npanels = (int64_t)ceil((double)_N/((double)Nthr*(double)Nblocks));
    }

    double *ps_h, *ps_d;
    start = std::clock();

    ps_h = (double*)calloc(Nthr,sizeof(double));
    cudaMalloc(  &ps_d, Nthr * sizeof(double) );
    cudaMemcpy(ps_d,ps_h,Nthr*sizeof(double), cudaMemcpyHostToDevice);

    // we will handle the remaining portions on CPU, here
    for(i = N ; i>_N; i--) {
      sum += pow(1.0/(double)i,2.0);
    }
    printf("Npanels=%lli, Nblocks=%lli\n",Npanels,Nblocks);

    // first compute inverse square
    for (j=0;j<Npanels;j++) {
       _innergpu_2_sqr<<< Nblocks, Nthr >>>(ps_d,j);
    }
    //_innergpu_2_sqr<<< _N, 1 >>>(ps_d);
    cudaMemcpy(ps_h,ps_d,Nthr*sizeof(double), cudaMemcpyDeviceToHost);
    for(i = 0 ; i<Nthr; i++) {
      //printf("ps_h[%lld]=%18.15f, sum=%18.15f\n",i,ps_h[i],sum);
      sum += ps_h[i];
    }

    end = std::clock();


    // Clean up
    cudaFree(ps_d);
    free(ps_h);

    printf("sum = %18.16f\n",sum);
}
