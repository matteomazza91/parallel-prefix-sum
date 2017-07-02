#!/usr/bin/gnuplot
reset

plot "toplot" using 1:3
max_y = GPVAL_DATA_Y_MAX

plot 'toplot' u ($3 == max_y ? $3 : 0):1
max_pos_x = GPVAL_DATA_Y_MAX




set terminal png

#set xdata time
#set timefmt "%d/%m/%Y %H:%M:%S"
#set format x "%H:%M"
set xlabel "parallel degree"

set ylabel "speedup"
set yrange [0:60]
set xrange [0:240]

set title "speedup plot"
#set key reverse Left outside
set grid

set style data linespoints


set label 1 gprintf("max = %g", max_y) at 2, max_y+2

plot "toplot" using 1:3 title "real", \
"" using 1:1 title "ideal", \
"" using 1:4 title "calculated", \
max_y