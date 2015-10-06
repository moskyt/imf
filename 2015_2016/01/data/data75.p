set terminal png
set output "plots/data75.png"
plot "search/data75.csv" using 1:2 with linespoints
