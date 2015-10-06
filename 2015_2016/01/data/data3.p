set terminal png
set output "plots/data3.png"
plot "search/data3.csv" using 1:2 with linespoints
