set terminal png
set xdata time
set timefmt "%m/%d/%Y"
set output "data_c02_ao.png"
plot "data_c02.csv" using 1:3
