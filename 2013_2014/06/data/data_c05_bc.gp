set terminal postscript eps enhanced
set title "Boric acid concentration in c05"
set xlabel "date"
set ylabel "Boric acid concentration"
set xdata time
set timefmt "%m/%d/%Y"
set key off
set rmargin 2
set output "bc_c05.eps"
plot "data_c05.csv" using 1:2
set terminal png
set output "bc_c05.png"
plot "data_c05.csv" using 1:2
