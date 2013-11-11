set terminal png
set output "data_c01_ao.png"
set xdata time
set timefmt "%m/%d/%Y"
plot "data_c01.csv" using 1:3
