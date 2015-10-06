set terminal png
set output "plots/data41.png"
plot "search/data41.csv" using 1:2 with linespoints
