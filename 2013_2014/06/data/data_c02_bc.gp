set terminal postscript eps enhanced
set title "Boric acid concentration in c02"
set xlabel "date"
set ylabel "Boric acid concentration"
set xdata time
set timefmt "%m/%d/%Y"
set output "bc_c02.eps"
set key off
set rmargin 2
plot "data_c02.csv" using 1:2
