set terminal png
set output "plots/data63.png"
plot "search/data63.csv" using 1:2 with linespoints
