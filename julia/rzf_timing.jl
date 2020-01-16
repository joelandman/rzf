#!/usr/bin/env julia
using Printf
using Distributed
using TimerOutputs
using CUDAdrv
using CUDAnative
using CuArrays

function ζ_gen_range(mstart,mend,e)
    s = 0.0
    for i=mstart:-1:mend
      s += (1.0/i)^e
    end
    s
end

function ζ_gen_thr_range(mstart,mend,e)
    s = 0
    cls  = 8  # cache line size in units of Float64 storage size
              # so we can avoid false sharing
    Nthr = Threads.nthreads()
    psum = zeros(Float64,Nthr*cls)
    ms   = zeros(Float64,Nthr*cls)
    me   = zeros(Float64,Nthr*cls)

    # preparing each thread, start, end, and partial sums
    for i=1:Nthr
        ms[i*cls]   = (N/Nthr)*i
        me[i*cls]   = 1 + (N/Nthr)*(i-1)
        psum[i*cls] = 0.0
    end

    # actual function we will execute per thread
    # psums will be updated per thread id.  This is why
    # the psums are spaced 1 cache line apart, versus adjacent indices
    function inner!(psum,ms,me,x)
        ndx     = Threads.threadid()
        for i=ms[ndx*cls]:-1:me[ndx*cls]
            psum[ndx*cls] += (1.0/i)^e
        end
	nothing
    end

    # Threaded inner loop, each thread has no dependence upon others
    Threads.@threads for t=1:Nthr
        inner!(psum,ms,me,2)
    end

    # now sum up the partial sums and return s
    s = sum(psum)
    s
end

function ζ_gen_gpu_range(N)

    Nthr = 512
    st   = 8

    psum_d = CuArrays.fill(0.0::Float64, Nthr*st)

    # actual function we will execute per thread
    # psums will be updated per thread id.  This is why
    # the psums are spaced 1 cache line apart, versus adjacent indices
    function innergpu!(N,ps)
        ndx     = threadIdx().x
        stride  = blockDim().x


        for i=ndx:stride:N
		#for i=N:-stride:ndx
	    	r = 1.0/i
            ps[ndx] += r*r
        end
        return nothing
    end

    # Threaded inner loop, each thread has no dependence upon others
    @cuda threads=Nthr  innergpu!(N,psum_d)

    # now sum up the partial sums and return s
    s = sum(psum_d)
    s
end

function ζ_2_pow2_range(mstart,mend)
    s = 0.0
    for i=mstart:-1:mend
      s += (1.0/i)^2
    end
    s
end

function ζ_2_sqr_2_range(mstart,mend)
    s = 0.0
    for i=mstart:-1:mend
      s += (1.0/i)*(1.0/i)
    end
    s
end

function ζ_gen_simd_range(mstart,mend,e)
    s = 0.0
    @simd for i=mstart:-1:mend
      s += (1.0/i)^e
    end
    s
end

function ζ_2_pow2_simd_range(mstart,mend)
    s = 0.0
    @simd for i=mstart:-1:mend
      s += (1.0/i)^2
    end
    s
end

function ζ_2_sqr_simd_range(mstart,mend)
    s = 0.0
    @simd for i=mstart:-1:mend
      s += (1.0/i)*(1.0/i)
    end
    s
end

to = TimerOutput()

N = 16000

# first bit of code to handle the compilation stage, otherwise you
# see this in the time output
s = ζ_gen_range(N,1,2) + ζ_2_pow2_range(N,1) + ζ_2_sqr_2_range(N,1) +
    ζ_gen_simd_range(N,1,2) + ζ_2_pow2_simd_range(N,1) +
    ζ_2_sqr_simd_range(N,1) + ζ_gen_thr_range(N,1,2) + ζ_gen_gpu_range(N)

s /= 8.0
@printf("s=%f\n",s)
s=0.0

@timeit to "ζ_gen_range"            s+=ζ_gen_range(N,1,2)
@timeit to "ζ_2_pow2_range"         s+=ζ_2_pow2_range(N,1)
@timeit to "ζ_2_sqr_2_range"        s+=ζ_2_sqr_2_range(N,1)
@timeit to "ζ_gen_simd_range"       s+=ζ_gen_simd_range(N,1,2)
@timeit to "ζ_2_pow2_simd_range"    s+=ζ_2_pow2_simd_range(N,1)
@timeit to "ζ_2_sqr_simd_range"     s+=ζ_2_sqr_simd_range(N,1)
@timeit to "ζ_gen_thr_range"        s+=ζ_gen_thr_range(N,1,2)
@timeit to "ζ_gen_gpu_range"        s+=ζ_gen_gpu_range(N)

s /= 8.0
@printf("s=%f\n",s)

show(to)
@printf("\n");
