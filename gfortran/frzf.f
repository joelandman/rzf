program rzf

integer k,n,inf
double precision sum,x

n  = 0
sum= 0.0d0

inf=1000000000

do k=inf-1,1,-1
   sum = sum + (1.0d0/dble(k))**2
enddo

print *,"zeta(",n,") = ",sum

end
