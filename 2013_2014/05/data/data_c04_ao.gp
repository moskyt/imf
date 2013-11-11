set terminal png
set output "data_c04_ao.png"
set xdata time
set timefmt "%m/%d/%Y"
plot "data_c04.csv" using 1:3
