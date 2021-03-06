set terminal postscript eps enhanced 'Times-Roman' color 20
#set logscale x
#set logscale y
#set format x '%L'
#set format y '%L'
#set xtics (0.001,0.01)
#set ytics (1,10,1E2)
#set tics scale 2
set grid
#set key samplen 2
#set key spacing 1.5
#set xlabel 'cost' offset -1,0
#set ylabel 'log_{/=10 10} L (Mpc)' offset 1,0
set xrange [10:100]
#set yrange [1E-5:2E8]

set lmargin 8
set output 'plots/dchi2_combine_Eresnl_error_ERES.eps'
#set title 'P_{reactor} = PPPGW_{th}, V = VVVkton (RRR% free proton), YYY years'
#set title 'PPPGW_{th}, VVVkton (12% proton), YYY years, ({/Symbol=\144}E_{vis}/E_{vis})^2 = (a % / {/Symbol=\326}E_{vis})^2 + (b %)^2'
set ylabel '{/=25 ({/Symbol=\104}{/Symbol=\143}^2)_{min}}' offset 1,0
set xlabel '{/=25 L [km]}' offset -1,0
#set label '1.5%' at 60,15
#set label '3%' at 50,14
#set label '6%' at 50,9
set yrange [0:YMAX]
set pointsize 1.5
set multiplot
plot \
'DATADIR/dchi2min_nh_ERES_0.dat' u 1:2 t '(a, b) = (ERES, 0) NH'  w l lt 1 lc rgb 'red' lw 3 ,\
'DATADIR/dchi2min_ih_ERES_0.dat' u 1:2 t '     IH'  w l lt 2 lc rgb 'red' lw 3 ,\
'DATADIR/dchi2_error_nh_ERES_0.dat' u 1:2:3 notitle  w yerrorbars pointtype 2 lt 1 lc rgb 'red' lw 3 ,\
'DATADIR/dchi2min_nh_ERES_0.5.dat' u 1:2 t '(ERES, 0.5) NH'  w l lt 1 lc rgb 'blue' lw 3 ,\
'DATADIR/dchi2min_ih_ERES_0.5.dat' u 1:2 t '   IH'  w l lt 2 lc rgb 'blue' lw 3 ,\
'DATADIR/dchi2_error_nh_ERES_0.5.dat' u 1:2:2:($2+$3) notitle  w yerrorbars pointtype 2 lt 1 lc rgb 'blue' lw 3 ,\
'DATADIR/dchi2min_nh_ERES_0.75.dat' u 1:2 t '(ERES, 0.75) NH'  w l lt 1 lc rgb '#006400' lw 3 ,\
'DATADIR/dchi2min_ih_ERES_0.75.dat' u 1:2 t '   IH'  w l lt 2 lc rgb '#006400' lw 3 ,\
'DATADIR/dchi2_error_nh_ERES_0.75.dat' u 1:2:2:($2+$3) notitle  w yerrorbars pointtype 2 lt 1 lc rgb '#006400' lw 3 ,\
'DATADIR/dchi2min_nh_ERES_1.dat' u 1:2 t '(ERES, 1) NH'  w l lt 1 lc rgb 'brown' lw 3 ,\
'DATADIR/dchi2min_ih_ERES_1.dat' u 1:2 t '   IH'  w l lt 2 lc rgb 'brown' lw 3 ,\
'DATADIR/dchi2_error_nh_ERES_1.dat' u 1:2:2:($2+$3) notitle  w yerrorbars pointtype 2 lt 1 lc rgb 'brown' lw 3
unset bars
plot \
'DATADIR/dchi2_error_nh_ERES_0.5.dat' u 1:2:($2-$3):2 notitle  w yerrorbars pointtype 2 lt 1 lc rgb 'blue' lw 3 ,\
'DATADIR/dchi2_error_nh_ERES_0.75.dat' u 1:2:($2-$3):2 notitle  w yerrorbars pointtype 2 lt 1 lc rgb '#006400' lw 3 ,\
'DATADIR/dchi2_error_nh_ERES_1.dat' u 1:2:($2-$3):2 notitle  w yerrorbars pointtype 2 lt 1 lc rgb 'brown' lw 3
set nomultiplot

reset
