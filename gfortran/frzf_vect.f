program rzf

double precision pi, pi_squared_over_6, zeta_2, zeta
integer*8 N 
pi = 3.1415926535897
pi_squared_over_6 = pi*pi / 6.0
N = 16000000000_8
zeta_2 = zeta(N,2_8)

print *,"    zeta(2) = ",zeta_2
print *,"pi^2 / 6.0  = ",pi_squared_over_6
print *,"      error = ",pi_squared_over_6 - zeta_2


end

double precision function zeta(N,a)
integer*8 N,a,k,upper,lower
integer unr
double precision xsum, ri
double precision, dimension(4) :: r,ik,dk = (/ 4.0d0,4.0d0,4.0d0,4.0d0/), qsum = 0.0d0


xsum = 0.0
upper = (N) - ((modulo(N,4))) 
lower = 4

do k=N-1,upper+1,-1
        ri = 1.0d0/k
        xsum = xsum + ri**a
enddo

do unr=1,4
  ik(unr) = dble( upper - (unr-1) )
enddo 

do k=upper,2*lower,-4
        r = 1.0d0 / ik
        ik = ik - dk
        qsum = qsum + r**a
enddo 

do k=lower,1,-1
   ri = 1.0d0/k
   xsum = xsum + ri**a
enddo

zeta = xsum + sum(qsum)

end function

