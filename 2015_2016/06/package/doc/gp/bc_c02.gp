set title "Cycle c02: boric acid"
set nokey
set xlabel "date"
set ylabel "boric acid"
set terminal png
set output "bc_c02.png"
set xdata time
set timefmt "%m/%d/%Y"
plot "data_c02.csv" using 1:2 with linespoints