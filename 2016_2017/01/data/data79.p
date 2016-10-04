set terminal png
set output "plots/data79.png"
plot "search/data79.csv" using 1:2 with linespoints
