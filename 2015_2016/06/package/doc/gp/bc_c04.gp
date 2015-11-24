set title "Cycle c04: boric acid"
set nokey
set xlabel "date"
set ylabel "boric acid"
set terminal png
set output "bc_c04.png"
set xdata time
set timefmt "%m/%d/%Y"
plot "data_c04.csv" using 1:2 with linespoints