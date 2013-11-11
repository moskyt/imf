set terminal png
set xdata time
set timefmt "%m/%d/%Y"
set output "data_c03_bc.png"
plot "data_c03.csv" using 1:2
