set terminal postscript eps enhanced
set title "Axial offset in c04"
set xlabel "date"
set ylabel "Axial offset"
set xdata time
set timefmt "%m/%d/%Y"
set output "data_c04_ao.eps"
set key off
set rmargin 2
plot "data_c04.csv" using 1:3
