set terminal png
set output "plots/data8.png"
plot "search/data8.csv" using 1:2 with linespoints
