set terminal png
set xdata time
set timefmt "%m/%d/%Y"
set output "data_c04_bc.png"
plot "data_c04.csv" using 1:2
