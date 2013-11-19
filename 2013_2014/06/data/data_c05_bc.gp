set terminal postscript eps enhanced
set title "Boric acid concentration in c05"
set xlabel "date"
set ylabel "Boric acid concentration"
set xdata time
set timefmt "%m/%d/%Y"
set output "bc_c05.eps"
set key off
set rmargin 2
plot "data_c05.csv" using 1:2
