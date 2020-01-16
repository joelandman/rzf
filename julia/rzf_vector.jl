#!/usr/bin/env julia
using Printf
using Distributed

function ζ(N::Int64,a::Int64)
  s = 0.0
  e = convert(Float64,a)

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
    #@printf("in warmup loop\n")
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
  if 0 == 1
   for i ∈ end_index:-1:1
     s += (1.0/i)^e
   end
  end
  #@printf("(post cleanup) s=%f\n",s)


  #for i in 1:VLEN
  # @printf("psum[%i]=%f\n",i,__P_SUM[i])
  #end

  # sum reduction
  s += @distributed (+) for i in 1:VLEN
       __P_SUM[i]
  end

  s

end

#N = 16000000000
N = 16000000


@time ζ_2 = ζ(N,2)
π_squared_over_6 = π^2 / 6.0;

@printf "      ζ(2) = %18.16f\n" ζ_2
@printf "π^2 / 6.0  = %18.16f\n" π_squared_over_6
@printf "     error = %18.16f\n" π_squared_over_6 - ζ_2
