set terminal postscript eps enhanced "Times-Roman" color 20
set grid
set key at graph 0.40, graph 0.9 samplen 2
#set key spacing 1.5
#set tics scale 2
set logscale x
#set format x "%L"
set xrange [1.81:6]
set xtics (2,3,4,5,6,7,8)    
set xtics add ("" 2.1 1, "" 2.2 1, "" 2.3 1, "" 2.4 1, "" 2.5 1, "" 2.6 1, "" 2.7 1, "" 2.8 1, "" 2.9 1, \
    	       "" 3.1 1, "" 3.2 1, "" 3.3 1, "" 3.4 1, "" 3.5 1, "" 3.6 1, "" 3.7 1, "" 3.8 1, "" 3.9 1, \
    	       "" 4.1 1, "" 4.2 1, "" 4.3 1, "" 4.4 1, "" 4.5 1, "" 4.6 1, "" 4.7 1, "" 4.8 1, "" 4.9 1, \
    	       "" 5.1 1, "" 5.2 1, "" 5.3 1, "" 5.4 1, "" 5.5 1, "" 5.6 1, "" 5.7 1, "" 5.8 1, "" 5.9 1)
#set logscale y
#set format y "%L"
#set ytics (1,10,1E2,1E3,1E4,1E5,1E6,1E7,1E8,1E9,1E10)

set output "plots/EventDistmin_fit2nh_combine_30_0_0.eps"
#set title "20GW_{th}, 5kton, 5 years, 30 km"

set size 1,1

set multiplot layout 2,1 scale 1,1 offset 0,0.05
set lmargin 9
set rmargin 2

set tmargin 2
set bmargin 0
unset xlabel
set format x ""
set ylabel '{/=23 dN / dE_{/Symbol=\156} [1/MeV]}' offset 1,-5
#set yrange [0:4E4]
#set label '{/Symbol=\144}E_{vis}/E_{vis} = 0%/{/Symbol=\326}E_{vis}' at graph 0.05, graph 0.5
set label '(a, b) = (0, 0)%' at graph 0.05, graph 0.5
#set ytics (10000,20000,30000,40000)
#set arrow from 1.82, 15000 to 1.82, 4000 lw 3  lc rgb 'red'
set label '{/=30 L=30 km}' at graph 0.45, graph 0.9
plot \
'rslt_test2/data/events_nh_30_0_0.dat' u ($1**2+0.8):($2/(2*$1)) t 'NH' w l lt 2 lc rgb 'blue' lw 3 ,\
'rslt_test2/data/events_ih_30_0_0.dat' u ($1**2+0.8):($2/(2*$1)) t 'IH' w l lt 2 lc rgb 'red' lw 3 ,\
'rslt_test2/data/events_nhmin_30_0_0.dat' u ($1**2+0.8):($2/(2*$1)) t 'Best Fit to NH data' w l lt 1 lc rgb '#006400' lw 2

set tmargin 0
set bmargin 2
unset ylabel
unset label
#set ytics (2000,3000,4000,5000,6000)
set xlabel '{/=23 E_{/Symbol=\156} [MeV]}' offset -1,0
set format x
#set label '{/Symbol=\144}E_{vis}/E_{vis} = 0%/{/Symbol=\326}E_{vis} +0%' at graph 0.05, graph 0.5
set label '(a, b) = (0, 0)%' at graph 0.05, graph 0.5
plot \
'rslt_test2/data/events_nh_30_0_0.dat' u ($1**2+0.8):($2/(2*$1)) notitle w l lt 2 lc rgb 'blue' lw 3 ,\
'rslt_test2/data/events_ih_30_0_0.dat' u ($1**2+0.8):($2/(2*$1)) notitle w l lt 2 lc rgb 'red' lw 3 ,\
'rslt_test2/data/events_nhmin_30_0_0.dat' u ($1**2+0.8):($2/(2*$1)) notitle w l lt 1 lc rgb '#006400' lw 2

set nomultiplot
