set terminal png
set xdata time
set timefmt "%m/%d/%Y"
set output "data_c01_ao.png"
plot "data_c01.csv" using 1:3
