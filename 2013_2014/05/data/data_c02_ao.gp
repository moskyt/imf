set terminal png
set output "data_c02_ao.png"
set xdata time
set timefmt "%m/%d/%Y"
plot "data_c02.csv" using 1:3
