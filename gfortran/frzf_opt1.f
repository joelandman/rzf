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
integer*8 N,a,k,ur,Nm
double precision sum, r

! unroll by 4
ur = 4

!top portion of loop
Nm = N - mod(N,ur)
sum = 0.0
do k=N-1,Nm,-1
   r = 1.0/k
   sum = sum + r**a
enddo

!unrolled portion of loop
do k=Nm-1,ur,-ur
   sum = sum + (1.0/dble(k-0))**a + (1.0/dble(k-1))**a + (1.0/dble(k-2))**a + (1.0/dble(k-3))**a
enddo

!bottom portion of loop
do k=ur-1,1,-1
   r = 1.0/k
   sum = sum + r**a
enddo

zeta = sum

end function

