set terminal postscript eps enhanced
set title "Axial offset in c03"
set xlabel "date"
set ylabel "Axial offset"
set xdata time
set timefmt "%m/%d/%Y"
set output "ao_c03.eps"
set key off
set rmargin 2
plot "data_c03.csv" using 1:3
