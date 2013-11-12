set terminal postscript eps enhanced
set title "Boric acid concentration in c03"
set xlabel "date"
set ylabel "Boric acid concentration"
set xdata time
set timefmt "%m/%d/%Y"
set output "data_c03_bc.eps"
set key off
plot "data_c03.csv" using 1:2
