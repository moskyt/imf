set title "Cycle c01: axial offset"
set nokey
set xlabel "date"
set ylabel "axial offset"
set terminal png
set output "ao_c01.png"
set xdata time
set timefmt "%m/%d/%Y"
plot "data_c01.csv" using 1:3 with linespoints