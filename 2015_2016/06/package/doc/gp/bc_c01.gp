set title "Cycle c01: boric acid"
set nokey
set xlabel "date"
set ylabel "boric acid"
set terminal png
set output "bc_c01.png"
set xdata time
set timefmt "%m/%d/%Y"
plot "data_c01.csv" using 1:2 with linespoints