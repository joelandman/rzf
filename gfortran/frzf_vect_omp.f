program rzf
use omp_lib

double precision pi, pi_squared_over_6, zeta_2, zeta, z2, zeta_fixed2
integer*8 N, u, l, Nthr, thrid
pi = 4.0d0*atan(1.0d0)
pi_squared_over_6 = pi*pi / 6.0d0
N = 16000000000_8
zeta_2 = 0.0d0


!$OMP PARALLEL shared(N) private(u,l,Nthr,thrid,i,z2) 
thrid = OMP_GET_THREAD_NUM()
Nthr  = omp_get_num_threads()

u     = N/Nthr * (thrid + 1)
l     = N/Nthr * (thrid) + 1
!z2    = zeta(u,l,2_8)
z2      = zeta_fixed2(u,l)

!$OMP ATOMIC
zeta_2 = zeta_2 + z2


!zeta(N,2_8)
!$OMP END PARALLEL



print *,"    zeta(2) = ",zeta_2
print *,"pi^2 / 6.0  = ",pi_squared_over_6
print *,"      error = ",pi_squared_over_6 - zeta_2


end

double precision function zeta(upper,lower,a)
integer*8 N,a,k,upper,lower
integer unr
double precision xsum, ri
double precision, dimension(4) :: r,ik,dk = (/ 4.0d0,4.0d0,4.0d0,4.0d0/), qsum = 0.0d0


xsum = 0.0

do unr=1,4
  ik(unr) = dble( upper - (unr-1) )
enddo 

do k=upper,lower,-4
        r = 1.0d0 / ik
        ik = ik - dk
        qsum = qsum + r**a
enddo 

zeta = xsum + sum(qsum)

end function

double precision function zeta_fixed2(upper,lower)
integer*8 N,k,upper,lower
integer unr
double precision xsum, ri
double precision, dimension(4) :: r,ik,dk = (/ 4.0d0,4.0d0,4.0d0,4.0d0/), qsum = 0.0d0


xsum = 0.0

do unr=1,4
  ik(unr) = dble( upper - (unr-1) )
enddo

do k=upper,lower,-4
        r = 1.0d0 / ik
        ik = ik - dk
        qsum = qsum + r*r ! r**a, when a is fixed at 2
enddo

zeta_fixed2 = xsum + sum(qsum)

end function

