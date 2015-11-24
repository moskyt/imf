set title "Cycle c05: boric acid"
set nokey
set xlabel "date"
set ylabel "boric acid"
set terminal png
set output "bc_c05.png"
set xdata time
set timefmt "%m/%d/%Y"
plot "data_c05.csv" using 1:2 with linespoints