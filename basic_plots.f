      program basic_plots
      implicitnone

      integer i,ndiv
      parameter (ndiv=1000)
      real*8 Emin,Emax,L,E,no_osc,prob_nor,prob_inv
      real*8 events_nor,events_inv,diff
      real*8 loemin,loemax,loe,z(20),error(10)
      real*8 P,V,Y,R,Np

      real*8 flux,xsec,prob_ee
      external flux,xsec,prob_ee

      include 'const.inc'

      L = 100d0 ! in km unit
      P = 20d0 ! in GW unit
      V = 5d0 ! in kton unit
      R = 0.05 ! free proton weight fraction in the detector volume
      Y = 5d0 ! in year unit

      Emin = 1.81d0
      Emax = 8d0
      
      z(1) = 0.852d0
      z(2) = 0.1d0
      z(3) = 7.5d-5
      z(4) = 2.35d-3
      error(1) = 0.025d0
      error(2) = 0.01d0
      error(3) = 0.2d-5
      error(4) = 0.1d-3

      Np = V*1d9*R*avog

      open(10,file="flux.dat",status="replace")
      open(11,file="noosc.dat",status="replace")
      open(12,file="xsec.dat",status="replace")
      open(13,file="prob.dat",status="replace")
      open(14,file="events.dat",status="replace")

      open(20,file="flux_loe.dat",status="replace")
      open(21,file="noosc_loe.dat",status="replace")
      open(22,file="xsec_loe.dat",status="replace")
      open(23,file="prob_loe.dat",status="replace")
      open(24,file="events_loe.dat",status="replace")

      do i = 1,ndiv
         loemin = L/Emax
         loemax = L/Emin
         loe = loemin +(loemax -loemin)/dble(ndiv)*(i-1)
         E = L/loe
         no_osc = flux(E)*xsec(E)*P/L**2*Np*Y*y2s
         prob_nor = prob_ee(loe,z,error,1,0,0)
         prob_inv = prob_ee(loe,z,error,-1,0,0)
         events_nor = no_osc*prob_nor
         events_inv = no_osc*prob_inv
         diff = 1d0 -prob_inv/prob_nor
         write(10,*) E,flux(E)
         write(11,*) E,no_osc
         write(12,*) E,xsec(E)
         write(13,*) E,prob_nor,prob_inv,diff
         write(14,*) E,no_osc,events_nor,events_inv,diff
         write(20,*) loe,flux(E)
         write(21,*) loe,no_osc
         write(22,*) loe,xsec(E)
         write(23,*) loe,prob_nor,prob_inv,diff
         write(24,*) loe,no_osc,events_nor,events_inv,diff
      enddo

      close(10)
      close(11)
      close(12)
      close(13)
      close(14)
      close(20)
      close(21)
      close(22)
      close(23)
      close(24)

      end
