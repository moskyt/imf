set terminal png
set xdata time
set timefmt "%m/%d/%Y"
set output "data_c01_bc.png"
plot "data_c01.csv" using 1:2
