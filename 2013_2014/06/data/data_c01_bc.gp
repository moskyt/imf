set terminal postscript eps enhanced
set title "Boric acid concentration in c01"
set xlabel "date"
set ylabel "Boric acid concentration"
set xdata time
set timefmt "%m/%d/%Y"
set output "data_c01_bc.eps"
set key off
set rmargin 2
plot "data_c01.csv" using 1:2
