#!/usr/bin/env julia
using Printf
using Distributed
using TimerOutputs

function ζ(N,a)
  s = 0.0
  e = 1.0*a

  VLEN      = 512   #vector length


  __P_SUM   = zeros(Float64,VLEN)

  __DEC     = zeros(Float64,VLEN)
  __D_POW	  = zeros(Float64,VLEN)
  __L 		  = zeros(Float64,VLEN)

  start_index = N - (N % VLEN);
  end_index = VLEN;
  #@printf("start = %i, end = %i\n",start_index,end_index)
  #@printf("N  = %i\n",N)


  for k in 1:VLEN
    __DEC[k]	= convert(Float64,VLEN)
    __L[k]		= convert(Float64,start_index - (k - 1));
  end


  #@printf("(pre warmup) s=%f\n",s)
  # warm up loop to handle non-vector size clean up before main loop
  if N == start_index
    s = 0.0
  else
   for i ∈ N:-1:start_index+1
    s += (1.0/i)^e
   end
  end
  #@printf("(post warmup) s=%f\n",s)

  # main loop
  for k in start_index:-VLEN:end_index
    __D_POW	  = (1.0 ./ __L).^e
    __P_SUM	 += __D_POW
    __L      -= __DEC
  end

  # clean up loop to handle post vector loop calc

  #for i in end_index:-1:1
  # s += (1.0/i)^e
  #end

  # sum reduction
  for i in 1:VLEN
       s+=__P_SUM[i]
  end

  s
end


to = TimerOutput()

N = 16000000000

st = 1
s =  zeros(Float64,32)
pd = zeros(Float64,32)
ndx = 1
#ENV["JULIA_DEBUG"] = "CUDAnative"

s[1] = ζ(N,2)

for i=1:1
  @printf("s[%i] = %f\n",i,s[i])
end

@timeit to "ζ"       pd[ndx] = ζ(N,2)
ndx+=1

for i=1:1
  @printf("pd[%i] = %f\n",i,pd[i])
end

show(to)
@printf("\n");
