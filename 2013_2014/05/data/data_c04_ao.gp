set terminal png
set xdata time
set timefmt "%m/%d/%Y"
set output "data_c04_ao.png"
plot "data_c04.csv" using 1:3