#!/usr/bin/env julia

function ζ(N::Int64,s::Int64)
  s = 0.0
  for i ∈ 1:N
    s+=(1.0/i)^2
  end
  s
end

N = 1000000000
@time ζ_2 = ζ(N,2)
π_squared_over_6 = π^2 / 6.0;

@printf "      ζ(2) = %18.16f\n" ζ_2
@printf "π^2 / 6.0  = %18.16f\n" π_squared_over_6
@printf "     error = %18.16f\n" π_squared_over_6 - ζ_2
