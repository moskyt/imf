set terminal png
set output "plots/data64.png"
plot "search/data64.csv" using 1:2 with linespoints
