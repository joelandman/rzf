#!/usr/bin/env python3


def ζ(a,N):
  s = 0.0
  for i in range(1,N):
     s+=(1.0/i)*(1.0/i)
  return s

print("rzf(2) = %f " % ζ(2,16000000000))
