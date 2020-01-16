#!/usr/bin/env julia
using Printf
using Distributed
using BenchmarkTools

VLEN      = 128   #vector length



function ζ(N::Int64,a::Int64)
  s = 0.0
  e = convert(Float64,a)


  __P_SUM   = zeros(Float64,VLEN)
  __DEC     = zeros(Float64,VLEN)
  __D_POW	  = zeros(Float64,VLEN)
  __L 		  = zeros(Float64,VLEN)

  start_index = N - (N % VLEN) - VLEN;
  end_index = VLEN*2;

  #@printf("start = %i, end = %i\n",start_index,end_index)
  #@printf("N  = %i\n",N)

  for k in 1:VLEN
    __DEC[k]	= convert(Float64,VLEN)
    __L[k]		= convert(Float64,start_index - (VLEN-k) );
  end

  #@printf("(pre warmup) s=%f\n",s)
  # warm up loop to handle non-vector size clean up before main loop
  if N == start_index
    s = 0.0
  else
  #  @printf("in warmup loop\n")
    scalar_inner!(s,N,start_index+1,e)
  end

  # main loop
  mstart = convert(Int64,start_index/VLEN)-1
  mend   = 1
  #@printf("mstart = %i, mend = %i\n",mstart,mend)
  #@printf("N = %i, mstart*vlen = %i\n",N,mstart*VLEN)

#  __P_SUM += @distributed (+) for k in mstart:-1:mend
#                (1.0 ./ (__L .- (m .* __DEC)).^e
#   end
  for k = mstart:-1:mend
    inner!(__P_SUM,k,__L,__DEC,e)
  end

  # sum reduction
  @simd for i in 1:VLEN
       s+=__P_SUM[i]
  end

  s
end

function inner!(psum,ndx,vect,dec,e)
    rndx = convert(Float64,ndx)
    for i=1:length(psum)
      psum[i] += (1.0/ (vect[i] - rndx*dec[i]))^e
    end
    nothing
end

function scalar_inner!(s,mstart,mend,e)
    for i=mstart:-1:mend
      s += (1.0/i)^e
    end
    nothing
end

function ζ_panel!(ps,N,a,mstart,mend)

  e         = convert(Float64,a)
  __P_SUM   = zeros(Float64,VLEN)
  __DEC     = zeros(Float64,VLEN)
  __D_POW	  = zeros(Float64,VLEN)
  __L 		  = zeros(Float64,VLEN)

  start_index = mstart * VLEN;
  end_index   = mend * VLEN;

  #@printf("start = %i, end = %i\n",start_index,end_index)
  #@printf("N  = %i\n",N)

  for k in 1:VLEN
    __DEC[k]	= convert(Float64,VLEN)
    __L[k]		= convert(Float64,start_index - (VLEN-k) );
  end
  # main loop

  @printf("mstart = %i, mend = %i\n",mstart,mend)
  @printf("N = %i, mstart*vlen = %i\n",N,mstart*VLEN)

#  __P_SUM += @distributed (+) for k in mstart:-1:mend
#                (1.0 ./ (__L .- (m .* __DEC)).^e
#   end
  for k = mstart:-1:mend
    inner!(__P_SUM,k,__L,__DEC,e)
  end

  ps += __P_SUM
  nothing

end

function rzf_panels(N::Int64,a::Int64)

  npanels = nprocs()
  start_index = N - (N % VLEN) - VLEN;
  end_index = VLEN*2;
  s = 0.0
  e = convert(Float64,a)
  psum = zeros(Float64,VLEN)


  # need to create mstart, mend from panels
  #   npanels * m_per_panel = start_index - (start_index % npanels)
  m_per_panel = floor(start_index - (start_index % npanels)/npanels)

  # pre panel
  scalar_inner!(s,N,start_index+1,e)

  for p=1:npanels-1
    @printf(" panel = %i\n",p)
    ζ_panel!(psum,N,a,p+1,p)
  end

  #
  for i = 1:length(psum)
    s+=psum[i]
  end
  s

end

#N = 16000000000
N = 16000


@time ζ_2 = ζ(N,2)
@time ζ_2_panels = rzf_panels(N,2)
π_squared_over_6 = π^2 / 6.0;

@printf("       ζ(2) = %18.16f\n",ζ_2)
@printf("ζ_panels(2) = %18.16f\n",ζ_2_panels)
@printf(" π^2 / 6.0  = %18.16f\n",π_squared_over_6)
@printf("      error = %18.16f\n",π_squared_over_6 - ζ_2)
