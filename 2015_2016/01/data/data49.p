set terminal png
set output "plots/data49.png"
plot "search/data49.csv" using 1:2 with linespoints
