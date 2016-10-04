set terminal png
set output "plots/data98.png"
plot "search/data98.csv" using 1:2 with linespoints
