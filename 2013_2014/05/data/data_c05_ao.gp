set terminal png
set xdata time
set timefmt "%m/%d/%Y"
set output "data_c05_ao.png"
plot "data_c05.csv" using 1:3
