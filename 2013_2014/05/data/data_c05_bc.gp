set terminal postscript eps enhanced
set title "Boric acid concentration in c05"
set xlabel "date"
set ylabel "Boric acid concentration"
set xdata time
set timefmt "%m/%d/%Y"
set output "data_c05_bc.eps"
set key off
plot "data_c05.csv" using 1:2
