#!/usr/bin/gnuplot
reset

plot "toplot" using 1:2
max_y = GPVAL_DATA_Y_MAX

set terminal png

#set xdata time
#set timefmt "%d/%m/%Y %H:%M:%S"
#set format x "%H:%M"
set xlabel "parallel degree"

set ylabel "scalability"
set yrange [0:30]
set xrange [1:100]

set title "scalability plot"
#set key reverse Left outside
set grid

set style data linespoints

set label 1 gprintf("max = %g", max_y) at 2, max_y+2

plot "toplot" using 1:2 title "real", \
"" using 1:1 title "ideal", \
"" using 1:5 title "calculated", \
max_y