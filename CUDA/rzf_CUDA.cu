#include <stdio.h>
#include <math.h>
#include <unistd.h>
#include <stdlib.h>
#include <cub/cub.cuh>

#include <cuda.h>
#include <cstring>
#include <ctime>

#include "Utilities.cuh"

#include <iostream>

#define M 1024
#define BLOCKSIZE   32
#define WARP_SIZE 32

// timing of functions
clock_t start,end;

/* invert and square every element of the input array in parallel */
__global__ void
_cuda_create_inverted_squared_array(double *in, unsigned int n, unsigned int offset)
{
    unsigned int globalIdx = blockIdx.x * blockDim.x + threadIdx.x;
    while(globalIdx < n)
    {
        in[globalIdx] = 1.0/(__uint2double_rn(globalIdx+offset) * __uint2double_rn(globalIdx+offset));
        globalIdx += blockDim.x * gridDim.x;
    }
}

// Riemann zeta function (2)
void cuda_riemann_zeta_function(int N) {
    // Get device properties to compute optimal launch bounds
    cudaDeviceProp prop;
    cudaGetDeviceProperties(&prop, 0);

    int pagesize=getpagesize();
    double sum = 0.0, *h_result = (double *)malloc((M / BLOCKSIZE) * sizeof(double))
    int _N;
    int num_SMs = prop.multiProcessorCount;

    // cheat a little ... reduce N by N mod (num_SMs*1024), so that
    // we don't have to pad with zeros, or put conditionals in
    // the vector flow
    _N = N - (N % (num_SMs * 1024));

    // we will handle the remaining portions on CPU, here
    for(i = N ; i>_N; i--) {
       sum += pow(1.0/(double)i,2.0);
    }


    double * d_a;
    start = std::clock();

    // create array on GPU
    cudaMalloc( (void**) &d_a, _N * sizeof(double) );


    // first compute inverse square
    _cuda_create_inverted_squared_array<<< num_SMs, 1024 >>>(d_a, scalar, _N);

    // second, parallel sum reduction over d_a
    reduce6();
    end = std::clock();


    // Clean up
    cudaFree(d_a);
    free(a);
}

/**************************/
/* BLOCK REDUCTION KERNEL */
/**************************/
__global__ void sum(const double * __restrict__ indata, double * __restrict__ outdata) {

    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // --- Specialize BlockReduce for type float.
    typedef cub::BlockReduce<double, BLOCKSIZE> BlockReduceT;

    // --- Allocate temporary storage in shared memory
    __shared__ typename BlockReduceT::TempStorage temp_storage;

    float result;
    if(tid < N) result = BlockReduceT(temp_storage).Sum(indata[tid]);

    // --- Update block reduction value
    if(threadIdx.x == 0) outdata[blockIdx.x] = result;

    return;
}



int main()
{
 double  y=0.0;
 int i,N = 100000000;

  for(i=N;i>=1;i--) {
     y += pow(1.0/(double)i,2.0);
  }

 printf("[index decreasing] sum = %18.16f\n",y);
}
