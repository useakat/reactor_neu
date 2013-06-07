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
set output 'plots/dchi2_combine.eps'
#set title 'P_{reactor} = 20GW_{th}, V = 5kton (12.00% free proton), 10 years'
#set title '20GW_{th}, 5kton, 10 years, {/Symbol=\144}E_{vis}/E_{vis} = ( a / {/Symbol=\326}E_{vis} + b )%'
set ylabel '{/=25 ({/Symbol=\104}{/Symbol=\143}^2)_{min}}' offset 1,0
set xlabel '{/=25 L [km]}' offset -1,0
#set label '1.5%' at 60,15
set label 'b = 0' at 77.5,5.5
#set label '6%' at 50,9
#set yrange [0:210]
set multiplot
plot \
'rslt_test3/data/dchi2min_nh_2_0.dat' u 1:2 t 'a = 2% NH'  w l lt 1 lc rgb 'purple' lw 3 ,\
'rslt_test3/data/dchi2min_ih_2_0.dat' u 1:2 t '     IH'  w l lt 2 lc rgb 'purple' lw 3 ,\
'rslt_test3/data/dchi2min_nh_2_0.dat' every::46::46 u 1:2 notitle w points pt 2 lt 1 lc rgb 'purple' lw 3 ,\
'rslt_test3/data/dchi2min_ih_2_0.dat' every::46::46 u 1:2 notitle w points pt 2 lt 1 lc rgb 'purple' lw 3 ,\
'rslt_test3/data/dchi2min_nh_3_0.dat' u 1:2 t '3% NH'  w l lt 1 lc rgb 'orange' lw 3 ,\
'rslt_test3/data/dchi2min_ih_3_0.dat' u 1:2 t '   IH'  w l lt 2 lc rgb 'orange' lw 3 ,\
'rslt_test3/data/dchi2min_nh_3_0.dat' every::46::46 u 1:2 notitle w points pt 2 lt 1 lc rgb 'orange' lw 3 ,\
'rslt_test3/data/dchi2min_ih_3_0.dat' every::46::46 u 1:2 notitle w points pt 2 lt 1 lc rgb 'orange' lw 3 ,\
'rslt_test3/data/dchi2min_nh_4_0.dat' u 1:2 t '4% NH'  w l lt 1 lc rgb '#006400' lw 3 ,\
'rslt_test3/data/dchi2min_ih_4_0.dat' u 1:2 t '   IH'  w l lt 2 lc rgb '#006400' lw 3 ,\
'rslt_test3/data/dchi2min_nh_4_0.dat' every::42::42 u 1:2 notitle w points pt 2 lt 1 lc rgb '#006400' lw 3 ,\
'rslt_test3/data/dchi2min_ih_4_0.dat' every::42::42 u 1:2 notitle w points pt 2 lt 1 lc rgb '#006400' lw 3 ,\
'rslt_test3/data/dchi2min_nh_5_0.dat' u 1:2 t '5% NH'  w l lt 1 lc rgb 'blue' lw 3 ,\
'rslt_test3/data/dchi2min_ih_5_0.dat' u 1:2 t '   IH'  w l lt 2 lc rgb 'blue' lw 3 ,\
'rslt_test3/data/dchi2min_nh_5_0.dat' every::37::37 u 1:2 notitle w points pt 2 lt 1 lc rgb 'blue' lw 3 ,\
'rslt_test3/data/dchi2min_ih_5_0.dat' every::36::36 u 1:2 notitle w points pt 2 lt 1 lc rgb 'blue' lw 3 ,\
'rslt_test3/data/dchi2min_nh_6_0.dat' u 1:2 t '6% NH'  w l lt 1 lc rgb 'red' lw 3 ,\
'rslt_test3/data/dchi2min_ih_6_0.dat' u 1:2 t '   IH'  w l lt 2 lc rgb 'red' lw 3 ,\
'rslt_test3/data/dchi2min_nh_6_0.dat' every::24::24 u 1:2 notitle w points pt 2 lt 1 lc rgb 'red' lw 3 ,\
'rslt_test3/data/dchi2min_ih_6_0.dat' every::19::19 u 1:2 notitle w points pt 2 lt 1 lc rgb 'red' lw 3
set nomultiplot

reset
