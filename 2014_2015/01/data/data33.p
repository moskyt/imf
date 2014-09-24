set terminal png
set output "plots/data33.png"
plot "search/data33.csv" using 1:2 with linespoints
