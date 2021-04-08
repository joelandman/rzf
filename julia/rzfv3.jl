#!/usr/bin/env julia
using Printf
using Distributed
using TimerOutputs
using LoopVectorization
using CUDA

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


    # Threaded inner loop, each thread has no dependence upon others
    Threads.@threads for t=1:Nthr
        innercpu_1!(psum,ms,me,2,cls)
    end

    # now sum up the partial sums and return s
    s = sum(psum)
    s
end

function ζ_2_sqr_thr_range(mstart,mend)
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

    # Threaded inner loop, each thread has no dependence upon others
    Threads.@threads for t=1:Nthr
        innercpu_2!(psum,ms,me,2,cls)
    end

    # now sum up the partial sums and return s
    s = sum(psum)
    s
end

function ζ_2_sqr_gpu_range(N)
    #dev = CuDevice(0)
    #ctx = CuContext(dev)
    #MAX_THREADS_PER_BLOCK = CUDAdrv.attribute(dev, CUDAdrv.DEVICE_ATTRIBUTE_MAX_THREADS_PER_BLOCK)
	MAX_THREADS_PER_BLOCK = 1024
    Nthr    = min(N, MAX_THREADS_PER_BLOCK)
    Nblocks = ceil.(Int, N / Nthr)

    psum_d = CuArrays.fill(0.0::Float64, Nthr)
	p  = zeros(Float64,Nthr)
	@printf("Nblocks = %i\nNthr = %i\n",Nblocks,Nthr)

    @cuda blocks=Nblocks threads=Nthr  innergpu_1!(psum_d)
    copyto!(p,psum_d)
    s = sum(p)
    s
end

function innercpu_1!(psum,ms,me,x,cls)
	ndx     = Threads.threadid()
	@simd for i=ms[ndx*cls]:-1:me[ndx*cls]
		r = 1.0/i
		@inbounds psum[ndx*cls] += r^x
	end
nothing
end

function innercpu_2!(psum,ms,me,x,cls)
	ndx     = Threads.threadid()
	@simd for i=ms[ndx*cls]:-1:me[ndx*cls]
		@inbounds psum[ndx*cls] += (1.0/i)*(1.0/i)
	end
	return nothing
end

function innercpu_3!(psum,ms,me,x,cls)
        ndx     = Threads.threadid()
        @avx for i=ms[ndx*cls]:-1:me[ndx*cls]
                @inbounds psum[ndx*cls] += (1.0/i)*(1.0/i)
        end
        return nothing
end

function innergpu_1!(ps)
	ndx     = threadIdx().x
	i = (blockIdx().x-1) * blockDim().x + threadIdx().x
	r = 1.0/i
	@atomic ps[ndx] += r*r
	return nothing
end

function ζ_2_sqr_simd_range(mstart,mend)
    s = 0.0
    @simd for i=mstart:-1:mend
      s += (1.0/i)*(1.0/i)
    end
    s
end

function ζ_2_sqr_avx_range(mstart,mend)
    s = 0.0
    @avx for i=mstart:-1:mend
      s += (1.0/i)*(1.0/i)
    end
    s
end


to = TimerOutput()

N = 16000000000
#N = 16000000
#Nthr = 1024
st = 1
s =  zeros(Float64,32)
pd = zeros(Float64,32)
ndx = 1
#ENV["JULIA_DEBUG"] = "CUDAnative"

# first bit of code to handle the compilation stage, otherwise you
# see this in the time output

s[1] = ζ_2_sqr_simd_range(N,1)       #
s[2] = ζ_gen_thr_range(N,1,2)        #
s[3] = ζ_2_sqr_thr_range(N,1)        #
s[4] = ζ_2_sqr_gpu_range(N)  #


for i=1:4
  @printf("s[%i] = %f\n",i,s[i])
end


@timeit to "ζ_gen_thr_range"       pd[ndx] = ζ_gen_thr_range(N,1,2)
ndx+=1

@timeit to "ζ_2_sqr_thr_range"     pd[ndx] = ζ_2_sqr_thr_range(N,1)
ndx+=1

@timeit to "ζ_2_sqr_simd_range"    pd[ndx] = ζ_2_sqr_simd_range(N,1)
ndx+=1

@timeit to "ζ_2_sqr_gpu_range"     pd[ndx] = ζ_2_sqr_gpu_range(N)
ndx+=1

for i=1:4
  @printf("pd[%i] = %f\n",i,pd[i])
end

show(to)
@printf("\n");
