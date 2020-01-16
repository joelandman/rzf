#!/usr/bin/env julia

using Printf
using CUDAnative
using CuArrays

N=10
a_d=CuArrays.fill(2.0::Float64, N)
b_d=CuArrays.fill(3.0::Float64, N)
a  =zeros(Float64,N)
b  =zeros(Float64,N)
r  =zeros(Float64,N)
copyto!(a,a_d)
copyto!(b,b_d)

c = a .+ b
for j in c
  @printf("cpu -> %i\n",j)
end

function add_works!(a,b)
 for i in 1:length(a)
   a[i] += b[i]
 end
 nothing
end

# this works
@cuda  threads=1 add_works!(a_d,b_d)


function add_fails!(a,b)
  a .+= b
  nothing
end

# this fails
@cuda  threads=1 add_fails!(a_d,b_d)

copyto!(r,a_d)

for i in r
 @printf("gpu -> %i\n",i)
end


