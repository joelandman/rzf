#!/usr/bin/env julia
using Printf

function ζ(N::Int64,a::Int64)
  u = 4
  Nm = N - N % u
  s = 0.0
  
  @simd for i ∈ 1:u:Nm
    s += (1.0/i)^a + (1.0/(i+1))^a + (1.0/(i+2))^a + (1.0/(i+3))^a 
  end

  for i ∈ Nm:N
    s += (1.0/i)^a
  end

  s
end

N = 16000000000
@time ζ_2 = ζ(N,2)
π_squared_over_6 = π^2 / 6.0;

@printf "      ζ(2) = %18.16f\n" ζ_2
@printf "π^2 / 6.0  = %18.16f\n" π_squared_over_6
@printf "     error = %18.16f\n" π_squared_over_6 - ζ_2
