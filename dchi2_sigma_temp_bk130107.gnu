set terminal postscript eps enhanced 'Times-Roman' color 20
#set logscale x
set logscale y
#set format x '%L'
set format y '10^{%L}'
set xtics (0,1,2,3,4,5,6,7,8,9,10,11)
#set ytics (1,10,1E2)
#set tics scale 2
set grid
set key at graph 0.42,0.37
#set key spacing 1.5
#set xlabel 'cost' offset -1,0
#set ylabel 'log_{/=10 10} L (Mpc)' offset 1,0
#set xrange [0:12]
#set yrange [1E-7:2]
set mxtics 10
set mytics 10

n=11
set lmargin 8
set output 'plots/dchi2_sigma.eps'
#set title 'P_{reactor} = PPPGW_{th}, V = VVVkton (RRR% free proton), YYY years'
#set title 'PPPGW_{th}, VVVkton (RRR% proton), ({/Symbol=\144}E_{vis}/E_{vis})^2 = (a %/ {/Symbol=\326}E_{vis})^2 + (b %)^2'
set ylabel '{/=25 1 - P}' offset 0,0
set xlabel '{/=25 {/Symbol=\326}({/Symbol=\104}{/Symbol=\143}^2)_{min}}' offset -1,0
#set xlabel '{/=25 Years}' offset -1,0
set label '1{/Symbol=\163}' at n,0.3173 offset 0.5,0
set label '2{/Symbol=\163}' at n,0.0455 offset 0.5,0
set label '3{/Symbol=\163}' at n,0.0027 offset 0.5,0
set label '4{/Symbol=\163}' at n,0.000063 offset 0.5,0
set label '5{/Symbol=\163}' at n,0.00000057 offset 0.5,0
set label '6{/Symbol=\163}' at n,0.000000002 offset 0.5,0
set label '{/Symbol=\264}1/16' at 0.4,1.1 tc rgb 'red'
set label '{/Symbol=\264}1/4' at 1.3,0.7 tc rgb 'red'
set label '{/Symbol=\264}1' at 3.2,0.16 tc rgb 'red'
set label '{/Symbol=\264}4' at 6.5,0.002 tc rgb 'red'
set label '{/Symbol=\264}9' at 10,0.0000015 tc rgb 'red'
set label '{/Symbol=\264}1/4' at 0.3,0.2 tc rgb 'blue'
set label '{/Symbol=\264}1' at 1.65,0.15 tc rgb 'blue'
set label '{/Symbol=\264}4' at 3.4,0.025 tc rgb 'blue'
set label '{/Symbol=\264}9' at 5,0.0016 tc rgb 'blue'
set label '{/Symbol=\264}16' at 6.85,0.00006 tc rgb 'blue'
set label '{/Symbol=\264}25' at 8.5,0.0000015 tc rgb 'blue'
set xrange [0:11]
set yrange [1E-7:2]
set pointsize 0.01
set multiplot
plot \
'DATADIR/dchi2_cl_nh_2_0.5.dat' every::0::0 u (sqrt($1)):(1-$3):(sqrt($1-$3)):(sqrt($1+$3)):(1-($3+$4)):(1-($3-$4)) t '(a, b) = (2, 0.5): NH'  w xyerrorbars pointtype 7 lt 1 lc rgb 'red' lw 3 ,\
'DATADIR/dchi2_cl_nh_2_0.5.dat' every::0::15 u (sqrt($1)):(1-$3) notitle  w l lt 1 lc rgb 'red' lw 3 ,\
'DATADIR/dchi2_cl_ih_2_0.5.dat' every::0::0 u (sqrt($1)):(1-$3):(sqrt($1-$3)):(sqrt($1+$3)):(1-($3+$4)):(1-($3-$4)) t '                   IH'  w xyerrorbars pointtype 6 lt 2 lc rgb 'red' lw 3 ,\
'DATADIR/dchi2_cl_ih_2_0.5.dat' every::0::0 u (sqrt($1)):(1-$3) notitle  w l lt 2 lc rgb 'red' lw 3 ,\
'DATADIR/dchi2_cl_analytic_2_0.5.dat' every::0::0 u 1:3 notitle  w l lt 2 lc rgb 'red' lw 3 ,\
'DATADIR/dchi2_cl_nh_3_0.75.dat' every::0::0 u (sqrt($1)):(1-$3):(sqrt($1-$3)):(sqrt($1+$3)):(1-($3+$4)):(1-($3-$4)) t '        (3, 0.75): NH'  w xyerrorbars pointtype 5 lt 1 lc rgb 'blue' lw 3 ,\
'DATADIR/dchi2_cl_nh_3_0.75.dat' every::0::0 u (sqrt($1)):(1-$3) notitle  w l lt 1 lc rgb 'blue' lw 3 ,\
'DATADIR/dchi2_cl_ih_3_0.75.dat' every::0::0 u (sqrt($1)):(1-$3):(sqrt($1-$3)):(sqrt($1+$3)):(1-($3+$4)):(1-($3-$4)) t '                   IH'  w xyerrorbars pointtype 4 lt 2 lc rgb 'blue' lw 3 ,\
'DATADIR/dchi2_cl_ih_3_0.75.dat' every::0::0 u (sqrt($1)):(1-$3) notitle  w l lt 2 lc rgb 'blue' lw 3 ,\
'DATADIR/dchi2_cl_analytic_3_0.75.dat' every::0::0 u 1:3 notitle  w l lt 2 lc rgb 'blue' lw 3 ,\
'DATADIR/dchi2_cl_nostat.dat' u (sqrt($1)):(1-$2) t 'No Fluctuation'  w l lt 1 lc rgb 'black' lw 5 ,\
0.3173 notitle w l lt 2 lc rgb 'black' lw 3 ,\
0.0455 notitle w l lt 2 lc rgb 'black' lw 3 ,\
0.0027 notitle w l lt 2 lc rgb 'black' lw 3 ,\
0.000063 notitle w l lt 2 lc rgb 'black' lw 3 ,\
0.00000057 notitle w l lt 2 lc rgb 'black' lw 3 ,\
0.000000002 notitle w l lt 2 lc rgb 'black' lw 3
set nomultiplot

reset
