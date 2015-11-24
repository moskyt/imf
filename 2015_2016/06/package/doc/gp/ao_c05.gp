set title "Cycle c05: axial offset"
set nokey
set xlabel "date"
set ylabel "axial offset"
set terminal png
set output "ao_c05.png"
set xdata time
set timefmt "%m/%d/%Y"
plot "data_c05.csv" using 1:3 with linespoints