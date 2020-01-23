#!/usr/bin/env python3


def ζ(a,N):
  s = 0.0
  for i in range(1,N):
     s+=1.0/pow(i,a)
  return s

print("rzf(2) = %f " % ζ(2,1000000000))
