set terminal postscript eps enhanced 'Times-Roman' color 17
set logscale x
#set logscale y
#set format x '%L'
#set format y '10^%L'
set xtics (2,3,4,5,6,7,8)    
set xtics add ("" 1.1 1, "" 1.2 1, "" 1.3 1, "" 1.4 1, "" 1.5 1, "" 1.6 1, "" 1.7 1, "" 1.8 1, "" 1.9 1, \
"" 2.1 1, "" 2.2 1, "" 2.3 1, "" 2.4 1, "" 2.5 1, "" 2.6 1, "" 2.7 1, "" 2.8 1, "" 2.9 1, \
"" 3.1 1, "" 3.2 1, "" 3.3 1, "" 3.4 1, "" 3.5 1, "" 3.6 1, "" 3.7 1, "" 3.8 1, "" 3.9 1, \
"" 4.1 1, "" 4.2 1, "" 4.3 1, "" 4.4 1, "" 4.5 1, "" 4.6 1, "" 4.7 1, "" 4.8 1, "" 4.9 1, \
"" 5.1 1, "" 5.2 1, "" 5.3 1, "" 5.4 1, "" 5.5 1, "" 5.6 1, "" 5.7 1, "" 5.8 1, "" 5.9 1, \
"" 6.1 1, "" 6.2 1, "" 6.3 1, "" 6.4 1, "" 6.5 1, "" 6.6 1, "" 6.7 1, "" 6.8 1, "" 6.9 1, \
"" 7.1 1, "" 7.2 1, "" 7.3 1, "" 7.4 1, "" 7.5 1, "" 7.6 1, "" 7.7 1, "" 7.8 1, "" 7.9 1)
#set ytics (1E3,1E4,1E5)
#set tics scale 2
#set grid
#set key samplen 2
#set key spacing 1.5
#set xlabel 'cost' offset -1,0
#set ylabel 'log_{/=10 10} L (Mpc)' offset 1,0
set xrange [1.81:8]
#set yrange [1E-5:2E8]

set grid
#set key samplen 2 at 
set output 'plots/EventDist_combine_0.eps'
unset title
#set title '{/=20 PPPGW_{th}, VVVkton, YYY years, {/Symbol=\144}E_{vis}/E_{vis} = ERES%/{/Symbol=\326}E_{vis}} +ERESNL%'
set size 1,1.07
set multiplot layout 5,1 scale 1,1 offset 0,-0.05
set lmargin 9
set rmargin 3
set tmargin 0
set bmargin 0
unset xlabel
set format x ""
#set label '30 km' at 4.5,5E3
#set label '{/=20 {/Symbol=\163}_{input} = 0.024}' at 30,0.7
set ytics (10000,20000,30000,40000)
set yrange[1:4E4]
#set yrange[1E3:6E4]
#set yrange[1E3:6E4]
#set ytics (5E3,1E4,5E4)
set arrow from 1.81914, graph 0.35 to 1.81914, graph 0.15 lw 3  lc rgb 'red'
plot \
'DATADIR/events_nh_30_ERES_ERESNL.dat' u ($1**2+0.8):($2/(2*$1)) t '30 km NH'  w l lt 1 lc rgb 'blue' lw 1 ,\
'DATADIR/events_ih_30_ERES_ERESNL.dat' u ($1**2+0.8):($2/(2*$1)) t '      IH'  w l lt 1 lc rgb 'red' lw 1

unset title
unset label
set yrange[1:1.59E4]
#set yrange[1E3:2E4]
set ytics (2000,6000,10000,14000)
#set label '{/=25 sin^22{/Symbol=\161}_{13}}' at 12,0.35
#set label '{/=20 {/Symbol=\163}_{input} = 0.005}' at 30,0.65
unset arrow
set arrow from 2.425, graph 0.40 to 2.425, graph 0.2 lw 3  lc rgb 'red'
plot \
'DATADIR/events_nh_40_ERES_ERESNL.dat' u ($1**2+0.8):($2/(2*$1)) t '40 km NH'  w l lt 1 lc rgb 'blue' lw 1 ,\
'DATADIR/events_ih_40_ERES_ERESNL.dat' u ($1**2+0.8):($2/(2*$1)) t '      IH'  w l lt 1 lc rgb 'red' lw 1

unset label
set ylabel '{/=25 dN / dE_{/Symbol=\156} [1/MeV]}' offset 0.5,2
set yrange[1:7.9E3]
#set yrange[1E3:1E4]
set ytics (1000,3000,5000,7000)
#set label '{/=25 {/Symbol=\104}m^2_{12}}' at 12,0.35
#set label '{/=20 {/Symbol=\163}_{input} = 0.2{/Symbol=\264}10^{-5}}' at 30,0.7
unset arrow
set arrow from 3.03, graph 0.65 to 3.03, graph 0.45 lw 3  lc rgb 'red'
plot \
'DATADIR/events_nh_50_ERES_ERESNL.dat' u ($1**2+0.8):($2/(2*$1)) t '50 km NH'  w l lt 1 lc rgb 'blue' lw 1 ,\
'DATADIR/events_ih_50_ERES_ERESNL.dat' u ($1**2+0.8):($2/(2*$1)) t '      IH'  w l lt 1 lc rgb 'red' lw 1

unset label
unset ylabel
set xlabel '{/=25 E_{/Symbol=\156} [MeV]}' offset 0,-0.5
set format x
set yrange[1:4.9E3]
#set yrange[1E3:6E3]
set ytics (0,1000,2000,3000,4000)
#set label '{/=25 {/Symbol=\174}{/Symbol=\104}m^2_{13}{/Symbol=\174}}' at 12,0.4
#set label '{/=20 {/Symbol=\163}_{input} = 0.1{/Symbol=\264}10^{-3}}' at 30,0.7
unset arrow
set arrow from 3.638, graph 0.70 to 3.638, graph 0.50 lw 3  lc rgb 'red'
plot \
'DATADIR/events_nh_60_ERES_ERESNL.dat' u ($1**2+0.8):($2/(2*$1)) t '60 km NH'  w l lt 1 lc rgb 'blue' lw 1 ,\
'DATADIR/events_ih_60_ERES_ERESNL.dat' u ($1**2+0.8):($2/(2*$1)) t '      IH'  w l lt 1 lc rgb 'red' lw 1

set nomultiplot


reset
