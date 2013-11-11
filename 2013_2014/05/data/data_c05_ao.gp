set terminal png
set output "data_c05_ao.png"
set xdata time
set timefmt "%m/%d/%Y"
plot "data_c05.csv" using 1:3
