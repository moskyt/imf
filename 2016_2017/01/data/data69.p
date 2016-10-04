set terminal png
set output "plots/data69.png"
plot "search/data69.csv" using 1:2 with linespoints
