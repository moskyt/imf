set terminal png
set output "data_c03_ao.png"
set xdata time
set timefmt "%m/%d/%Y"
plot "data_c03.csv" using 1:3
