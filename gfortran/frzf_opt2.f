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
integer*8 N,a,k,j
double precision sum,r,q

sum = 0.0
do k=N-1,1,-1
   r = 1.0/dble(k)
   q = r
   do j=2,a
      q = q * r
   enddo
   sum = sum + q
enddo
zeta = sum

end function

