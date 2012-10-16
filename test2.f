      program test
      implicitnone

      integer i,j,k
      integer ierr,lencm,npari,nparx,istat,ndiv,mode
      real*8 arg(10),pval(10),perr(10),plo(10),phi(10),gint
      real*8 chisqmin,fedm,errdef,Lmin,Lmax,Eres,s2sun_2(2),Eres_nl
      real*8 s213_2(2),dm21_2(2),dm31_2(2),Emin,Emax,serror,snmax
      real*8 ovnorm(2),fa(2),fb(2),value
      character*10 name(10),iname,cLmin,cLmax,cndiv,cP,cV,CR,CY
      character*10 cEres,cmode,cEres_nl,cvalue
      
      integer iflag
      real*8 z(20),dchisq,grad,futil

      real*8 zz(40)
      common /zz/ zz

      integer lench
      external minfunc,lench

      call getarg(1,cLmin)
      call getarg(2,cLmax)
      call getarg(3,cndiv)
      call getarg(4,cP)
      call getarg(5,cV)
      call getarg(6,cR)
      call getarg(7,cY)
      call getarg(8,cEres)
      call getarg(9,cEres_nl)
      call getarg(10,cmode)
      call getarg(11,cvalue)
      read (cLmin,*) Lmin 
      read (cLmax,*) Lmax
      read (cndiv,*) ndiv 
      read (cP,*) zz(3) 
      read (cV,*) zz(4) 
      read (cR,*) zz(5) 
      read (cY,*) zz(6) 
      read (cEres,*) Eres 
      read (cEres_nl,*) Eres_nl 
      read (cmode,*) mode
      read (cvalue,*) value
      s2sun_2(1) = 0.857d0
      s2sun_2(2) = 0.024d0
      s213_2(1) = 0.098d0
      s213_2(2) = 0.005d0
      dm21_2(1) = 7.50d-5
      dm21_2(2) = 0.20d-5
      dm31_2(1) = 2.32d-3
      dm31_2(2) = 0.1d-3
      ovnorm(1) = 1d0
      ovnorm(2) = 0.03d0
      fa(1) = 1d0
      fa(2) = 0.1d0
      fb(1) = 1d0
      fb(2) = 0.1d0

      Emin = 1.81d0  
      Emax = 8d0
      serror = 1d-2
      snmax = 4

      zz(10) = s2sun_2(1)
      zz(11) = s2sun_2(2)
      zz(12) = s213_2(1)
      zz(13) = s213_2(2)
      zz(14) = dm21_2(1)
      zz(15) = dm21_2(2)
      zz(16) = dm31_2(1)
      zz(17) = dm31_2(2)
      zz(18) = ovnorm(1)
      zz(19) = ovnorm(2)
      zz(20) = fa(1)
      zz(21) = fa(2)
      zz(22) = fb(1)
      zz(23) = fb(2)

      zz(7) = Eres/100d0
      zz(8) = mode
      zz(30) = Emin
      zz(31) = Emax
      zz(32) = serror
      zz(33) = snmax
      zz(34) = Eres_nl
      zz(35) = ndiv

      open(19,file='dchi2_result.txt',status='replace')
      write(19,'(a11,e12.5,a3,e9.2)') "sin212_2 = ",s2sun_2(1)," +-"
     &     ,s2sun_2(2)
      write(19,'(a11,e12.5,a3,e9.2)') "sin213_2 = ",s213_2(1)," +-"
     &     ,s213_2(2)
      write(19,'(a11,e12.5,a3,e9.2)') "dm21_2 = ",dm21_2(1)," +-"
     &     ,dm21_2(2)
      write(19,'(a11,e12.5,a3,e9.2)') "dm31_2 = ",dm31_2(1)," +-"
     &     ,dm31_2(2)
      write(19,'(a11,e12.5,a3,e9.2)') "ovnorm = ",ovnorm(1)," +-"
     &     ,ovnorm(2)
      write(19,'(a11,e12.5,a3,e9.2)') "fa = ",fa(1)," +-"
     &     ,fa(2)
      write(19,'(a11,e12.5,a3,e9.2)') "fb = ",fb(1)," +-"
     &     ,fb(2)
      write(19,*) ""
      write(19,*) "Ev Range:",Emin," -",Emax," [MeV]"
      write(19,*) ""
      write(19,*) "( Simpson Integration Parameters )"
      write(19,*) "Accuracy:",serror
      write(19,*) "Max division = 2^",snmax+1
      write(19,*) ""
      write(19,*) ""
      write(19,*) "[Delta-Chi2 analysis]"

      if (mode.eq.0) then
         do k = -1,1,2
            zz(2) = k
            if (k.eq.1) then
               open(20,file='minorm_nh.dat',status='replace')
               open(21,file='dchi2min_nh.dat',status='replace')
               open(22,file='dchi2min_bestfit2nh.dat',status='replace')
               open(23,file='dchi2_vsparam_nh.dat',status='replace')
               write(19,*) "<NH case>"
            elseif (k.eq.-1) then
               open(20,file='minorm_ih.dat',status='replace')
               open(21,file='dchi2min_ih.dat',status='replace')
               open(22,file='dchi2min_bestfit2ih.dat',status='replace')
               open(23,file='dchi2_vsparam_ih.dat',status='replace')
               write(19,*) "<IH case>"
            endif
            do j = 0,ndiv
               zz(1) = Lmin +( Lmax -Lmin )/dble(ndiv)*j
               write(19,*) zz(1),"[km]"               
               call mninit(5,20,7)
               
               call mnparm(1,'s2sun_2',s2sun_2(1),s2sun_2(2),0d0,0d0
     &              ,ierr)
               call mnparm(2,'s213_2',s213_2(1),s213_2(2),0d0,0d0,ierr)
               call mnparm(3,'dm21_2',dm21_2(1),dm21_2(2),0d0,0d0,ierr)
               call mnparm(4,'dm31_2',dm31_2(1),dm31_2(2),0d0,0d0,ierr)
               call mnparm(5,'Norm',ovnorm(1),ovnorm(2),0d0,0d0,ierr)
               call mnparm(6,'fa',fa(1),fa(2),0d0,0d0,ierr)
               call mnparm(7,'fb',fb(1),fb(2),0d0,0d0,ierr)
c               call mncomd(minfunc,'FIX 4',iflag,0)
               call mncomd(minfunc,'FIX 6',iflag,0)
               call mncomd(minfunc,'FIX 7',iflag,0)

               arg(1) = 0d0
               call mnexcm(minfunc,'SET PRINTOUT',arg,1,ierr,0)
c               call mnexcm(minfunc,'SIMPLEX',arg,0,ierr,0)
c               arg(1) = 1d0
               call mnexcm(minfunc,'MIGRAD',arg,0,ierr,0)
c               call mnexcm(minfunc,'MINIMIZE',arg,0,ierr,0)
               
               call mnstat(chisqmin,fedm,errdef,npari,nparx,istat)
               do i = 1,nparx
                  call mnpout(i,name(i),pval(i),perr(i),plo(i),phi(i)
     &                 ,ierr)
               enddo

               write(21,'(e10.3,30e13.5)') zz(1),chisqmin,fedm
     &              ,pval(1),perr(1),s2sun_2(2),(pval(1)-s2sun_2(1))/s2sun_2(2)
     &              ,pval(2),perr(2),s213_2(2),(pval(2)-s213_2(1))/s213_2(2)
     &              ,pval(3),perr(3),dm21_2(2),(pval(3)-dm21_2(1))/dm21_2(2)
     &              ,pval(4),perr(4),dm31_2(2),(pval(4)-dm31_2(1))/dm31_2(2)
     &              ,pval(5),perr(5),ovnorm(2),(pval(5)-ovnorm(1))/ovnorm(2)
     &              ,pval(6),perr(6),fa(2),(pval(6)-fa(1))/fa(2)
     &              ,pval(7),perr(7),fb(2),(pval(7)-fb(1))/fb(2)
               write(22,'(e10.3,7e13.5)') zz(1),pval(1),pval(2),pval(3)
     &              ,pval(4),pval(5),pval(6),pval(7)
               if ((zz(1).ge.50d0).and.(zz(1).lt.50.9d0)) then
                  write(23,*) value, chisqmin
               endif
               write(19,'(4x,a14,e12.5,a3,e9.2)') "Delta-Chi2  = "
     &              ,chisqmin," +-",fedm
               write(19,'(4x,a14,e12.5,a3,e9.2)') "(sin2*12)^2 = "
     &              ,pval(1)," +-",perr(1)
               write(19,'(4x,a14,e12.5,a3,e9.2)') "(sin2*13)^2 = "
     &              ,pval(2)," +-",perr(2)
               write(19,'(4x,a14,e12.5,a3,e9.2)') "dm21^2      = "
     &              ,pval(3)," +-",perr(3)
               write(19,'(4x,a14,e12.5,a3,e9.2)') "dm31^2      = "
     &              ,pval(4)," +-",perr(4)
               write(19,'(4x,a14,e12.5,a3,e9.2)') "Normalization = "
     &              ,pval(5)," +-",perr(5)
               write(19,'(4x,a14,e12.5,a3,e9.2)') "Normalization = "
     &              ,pval(6)," +-",perr(6)
               write(19,'(4x,a14,e12.5,a3,e9.2)') "Normalization = "
     &              ,pval(7)," +-",perr(7)
               write(19,*) ""
               call mncomd(minfunc,'SET OUTPUTFILE 19',iflag,0)
               call mncomd(minfunc,'SHOW COVARIANCE',iflag,0)
               write(19,*) ""
               write(19,*) ""
            enddo
            write(19,*) ""
            write(19,*) ""
         enddo
         close(19)
         close(20)
         close(21)
         close(22)

      elseif (mode.eq.1) then ! For F vs. dsqrt(E) distribution
c         zz(1) = Lmin
         npari = 7
         do i = 1,npari
            z(i) = 1d0
         enddo
         call minfunc(npari,grad,dchisq,z,iflag,0)

      elseif (mode.eq.2) then ! For dN/dE plots
         npari = 7
         do i = 1,npari
            z(i) = 1d0
         enddo
         zz(1) = Lmin
         call minfunc(npari,grad,dchisq,z,iflag,0)

      elseif (mode.eq.3) then ! For F vs. L/E distribution
         zz(1) = Lmin
         npari = 7
         do i = 1,npari
            z(i) = 1d0
         enddo
         call minfunc(npari,grad,dchisq,z,iflag,0)

      elseif (mode.eq.4) then ! For F vs. E distribution
         zz(1) = Lmin
         npari = 7
         do i = 1,npari
            z(i) = 1d0
         enddo
         call minfunc(npari,grad,dchisq,z,iflag,0)

      elseif (mode.eq.5) then ! For dN/dE distribution
         zz(1) = Lmin
         npari = 7
         do i = 1,npari
            z(i) = 1d0
         enddo
         call minfunc(npari,grad,dchisq,z,iflag,0)

      endif

      end