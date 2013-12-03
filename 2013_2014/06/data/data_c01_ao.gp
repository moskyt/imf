set terminal postscript eps enhanced
set title "Axial offset in c01"
set xlabel "date"
set ylabel "Axial offset"
set xdata time
set timefmt "%m/%d/%Y"
set key off
set rmargin 2
set output "ao_c01.eps"
plot "data_c01.csv" using 1:3
set terminal png
set output "ao_c01.png"
plot "data_c01.csv" using 1:3
