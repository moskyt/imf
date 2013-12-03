set terminal postscript eps enhanced
set title "Axial offset in c05"
set xlabel "date"
set ylabel "Axial offset"
set xdata time
set timefmt "%m/%d/%Y"
set key off
set rmargin 2
set output "ao_c05.eps"
plot "data_c05.csv" using 1:3
set terminal png
set output "ao_c05.png"
plot "data_c05.csv" using 1:3
