set terminal postscript eps enhanced 'Times-Roman' color 20
set grid
set key samplen 2 horizontal at graph 0.95, 0.9
set output 'plots/params.eps'
unset title
#set title '{/=20 P_{reactor} = PPPGW_{th}, V = VVVkton (RRR% free proton), YYY years}'
#set title '{/=20 PPPGW_{th}, VVVkton, YYY years}'
#set xlabel 'L [km]' offset -1,0
#set label '1.5%' at 60,15
#set label '3%' at 50,14
#set label '6%' at 50,9
set size 1,1.17
set xrange[10:100]
set multiplot layout 5,1 scale 1,1 offset 0,0.15
set lmargin 8
set rmargin 3
set tmargin 0
set bmargin 0
unset xlabel
#unset ylabel
set format x ""
#set ylabel '{/=25 pull factor}' offset 1,0
set label '{/=25 sin^22{/Symbol=\161}_{12}}' at 12,0.45
set ytics (-0.25,0,0.25,0.5)
set yrange[-0.5:0.75]
plot \
'DATADIR/dchi2min_nh_2_0.dat' u 1:7 t '2% NH'  w l lt 1 lc rgb 'purple' lw 3 ,\
'DATADIR/dchi2min_ih_2_0.dat' u 1:7 t '     IH'  w l lt 2 lc rgb 'purple' lw 3 ,\
'DATADIR/dchi2min_nh_3_0.dat' u 1:7 t '3% NH'  w l lt 1 lc rgb 'orange' lw 3 ,\
'DATADIR/dchi2min_ih_3_0.dat' u 1:7 t '   IH'  w l lt 2 lc rgb 'orange' lw 3 ,\
'DATADIR/dchi2min_nh_4.dat' u 1:7 t '4% NH'  w l lt 1 lc rgb '#006400' lw 3 ,\
'DATADIR/dchi2min_ih_4.dat' u 1:7 t '   IH'  w l lt 2 lc rgb '#006400' lw 3 ,\
'DATADIR/dchi2min_nh_5.dat' u 1:7 t '5% NH'  w l lt 1 lc rgb 'blue' lw 3 ,\
'DATADIR/dchi2min_ih_5.dat' u 1:7 t '   IH'  w l lt 2 lc rgb 'blue' lw 3 ,\
'DATADIR/dchi2min_nh_6.dat' u 1:7 t '6% NH'  w l lt 1 lc rgb 'red' lw 3 ,\
'DATADIR/dchi2min_ih_6.dat' u 1:7 t '   IH'  w l lt 2 lc rgb 'red' lw 3

unset title
unset label
set yrange[-0.55:0.75]
set ytics (-0.25,0,0.25,0.5)
set label '{/=25 sin^22{/Symbol=\161}_{13}}' at 12,0.45
plot \
'DATADIR/dchi2min_nh_1.5.dat' u 1:11 notitle  w l lt 1 lc rgb '#006400' lw 3 ,\
'DATADIR/dchi2min_ih_1.5.dat' u 1:11 notitle  w l lt 2 lc rgb '#006400' lw 3 ,\
'DATADIR/dchi2min_nh_3.dat' u 1:11 notitle  w l lt 1 lc rgb 'blue' lw 3 ,\
'DATADIR/dchi2min_ih_3.dat' u 1:11 notitle  w l lt 2 lc rgb 'blue' lw 3 ,\
'DATADIR/dchi2min_nh_6.dat' u 1:11 notitle  w l lt 1 lc rgb 'red' lw 3 ,\
'DATADIR/dchi2min_ih_6.dat' u 1:11 notitle  w l lt 2 lc rgb 'red' lw 3

unset label
set ylabel '{/=25 pull factor}' offset 1.5,0
set yrange[-0.5:0.75]
set ytics (-0.25,0,0.25,0.5)
set label '{/=25 {/Symbol=\104}m^2_{12}}' at 12,0.4
plot \
'DATADIR/dchi2min_nh_1.5.dat' u 1:15 notitle w l lt 1 lc rgb '#006400' lw 3 ,\
'DATADIR/dchi2min_ih_1.5.dat' u 1:15 notitle w l lt 2 lc rgb '#006400' lw 3 ,\
'DATADIR/dchi2min_nh_3.dat' u 1:15 notitle w l lt 1 lc rgb 'blue' lw 3 ,\
'DATADIR/dchi2min_ih_3.dat' u 1:15 notitle w l lt 2 lc rgb 'blue' lw 3 ,\
'DATADIR/dchi2min_nh_6.dat' u 1:15 notitle w l lt 1 lc rgb 'red' lw 3 ,\
'DATADIR/dchi2min_ih_6.dat' u 1:15 notitle w l lt 2 lc rgb 'red' lw 3

unset label
unset ylabel
set yrange[-0.5:0.75]
set ytics (-0.25,0,0.25,0.5)
set label '{/=25 {/Symbol=\174}{/Symbol=\104}m^2_{13}{/Symbol=\174}}' at 12,0.05
plot \
'DATADIR/dchi2min_nh_1.5.dat' u 1:19 notitle w l lt 1 lc rgb '#006400' lw 3 ,\
'DATADIR/dchi2min_ih_1.5.dat' u 1:19 notitle w l lt 2 lc rgb '#006400' lw 3 ,\
'DATADIR/dchi2min_nh_3.dat' u 1:19 notitle  w l lt 1 lc rgb 'blue' lw 3 ,\
'DATADIR/dchi2min_ih_3.dat' u 1:19 notitle  w l lt 2 lc rgb 'blue' lw 3 ,\
'DATADIR/dchi2min_nh_6.dat' u 1:19 notitle  w l lt 1 lc rgb 'red' lw 3 ,\
'DATADIR/dchi2min_ih_6.dat' u 1:19 notitle  w l lt 2 lc rgb 'red' lw 3

set xlabel '{/=25 L [km]}' offset 0,0
set format x
unset label
#set ylabel 'pull factor' offset 1.5,0
set yrange[-0.5:0.75]
set ytics (-0.25,0,0.25,0.5)
set label '{/=25 f_{sys}' at 14,0.4 
plot \
'DATADIR/dchi2min_nh_1.5.dat' u 1:23 notitle w l lt 1 lc rgb '#006400' lw 3 ,\
'DATADIR/dchi2min_ih_1.5.dat' u 1:23 notitle w l lt 2 lc rgb '#006400' lw 3 ,\
'DATADIR/dchi2min_nh_3.dat' u 1:23 notitle w l lt 1 lc rgb 'blue' lw 3 ,\
'DATADIR/dchi2min_ih_3.dat' u 1:23 notitle w l lt 2 lc rgb 'blue' lw 3 ,\
'DATADIR/dchi2min_nh_6.dat' u 1:23 notitle w l lt 1 lc rgb 'red' lw 3 ,\
'DATADIR/dchi2min_ih_6.dat' u 1:23 notitle w l lt 2 lc rgb 'red' lw 3

set nomultiplot


reset
