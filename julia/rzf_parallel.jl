#!/usr/bin/env julia
using Printf
using Distributed
using TimerOutputs

function ζ_dist(N,a)
  s = @distributed (+) for i ∈ 1:N
    (1.0/i)^a
  end
  s
end

function ζ_simd(N,a)
  s = 0.0
  @simd for i ∈ 1:N
    s+=(1.0/i)^a
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

    # Threaded inner loop, each thread has no dependence upon others
    Threads.@threads for t=1:Nthr
        inner_gen_cpu1!(psum,ms,me,cls,2)
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

    # Threaded inner loop, each thread has no dependence upon others
    Threads.@threads for t=1:Nthr
        inner_2_sqr_cpu1!(psum,ms,me,cls)
    end

    # now sum up the partial sums and return s
    s = sum(psum)
    s
end

function inner_gen_cpu1!(psum,ms,me,cls,x)
    ndx     = Threads.threadid()
    @simd for i=ms[ndx*cls]:-1:me[ndx*cls]
        psum[ndx*cls] += (1.0/i)^x
    end
    nothing
end

function inner_2_sqr_cpu1!(psum,ms,me,cls)
    ndx     = Threads.threadid()
    @simd for i=ms[ndx*cls]:-1:me[ndx*cls]
        psum[ndx*cls] += (1.0/i)*(1.0/i)
    end
    nothing
end
to = TimerOutput()

N = 16000000000
#N = 16000000
#Nthr = 1024
st = 1
s =  zeros(Float64,32)
pd = zeros(Float64,32)
ndx = 1


to = TimerOutput()

s[1] = ζ_dist(N,2)
s[2] = ζ_simd(N,2)
s[3] = ζ_gen_thr_range(N,1,2)
s[4] = ζ_2_sqr_thr_range(N,1)

for i=1:4
  @printf("s[%i] = %f\n",i,s[i])
end

@timeit to "ζ_dist"       pd[ndx] = ζ_dist(N,2)
ndx+=1

@timeit to "ζ_simd"       pd[ndx] = ζ_simd(N,2)
ndx+=1

@timeit to "ζ_gen_thr_range"     pd[ndx] = ζ_gen_thr_range(N,1,2)
ndx+=1

@timeit to "ζ_2_sqr_thr_range"    pd[ndx] = ζ_2_sqr_thr_range(N,1)

for i=1:4
  @printf("pd[%i] = %f\n",i,pd[i])
end

show(to)
@printf("\n");
