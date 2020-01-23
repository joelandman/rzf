#!/usr/bin/env julia
using Printf
using Distributed
using TimerOutputs
using CUDAdrv
using CUDAnative
using CuArrays

function ζ_2_sqr_gpu_range(N)
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

function ζ_gen_gpu_range(N)
	MAX_THREADS_PER_BLOCK = 1024
    Nthr    = min(N, MAX_THREADS_PER_BLOCK)
    Nblocks = ceil.(Int, N / Nthr)

    psum_d = CuArrays.fill(0.0::Float64, Nthr)
	p  = zeros(Float64,Nthr)
	@printf("Nblocks = %i\nNthr = %i\n",Nblocks,Nthr)

    @cuda blocks=Nblocks threads=Nthr  innergpu_2!(psum_d,2)
    copyto!(p,psum_d)
    s = sum(p)
    s
end

function innergpu_1!(ps)
	ndx     = threadIdx().x
	i = (blockIdx().x-1) * blockDim().x + threadIdx().x
	r = 1.0/i
	@atomic ps[ndx] += r*r
	return nothing
end

function innergpu_2!(ps,x)
	ndx     = threadIdx().x
	i = (blockIdx().x-1) * blockDim().x + threadIdx().x
	r = 1.0/i
	@atomic ps[ndx] += CUDAnative.pow.(r,x)
	return nothing
end
to = TimerOutput()

N = 16000000000
st = 1
s =  zeros(Float64,32)
pd = zeros(Float64,32)
ndx = 1
#ENV["JULIA_DEBUG"] = "CUDAnative"

# first bit of code to handle the compilation stage, otherwise you
# see this in the time output

s[1] = ζ_2_sqr_gpu_range(N)  #
s[2] = ζ_gen_gpu_range(N)

for i=1:2
  @printf("s[%i] = %f\n",i,s[i])
end

@timeit to "ζ_2_sqr_gpu_range"     pd[ndx] = ζ_2_sqr_gpu_range(N)
ndx+=1

@timeit to "ζ_gen_gpu_range"     pd[ndx] = ζ_gen_gpu_range(N)

for i=1:2
  @printf("pd[%i] = %f\n",i,pd[i])
end

show(to)
@printf("\n");
