set title "Cycle c04: axial offset"
set nokey
set xlabel "date"
set ylabel "axial offset"
set terminal png
set output "ao_c04.png"
set xdata time
set timefmt "%m/%d/%Y"
plot "data_c04.csv" using 1:3 with linespoints