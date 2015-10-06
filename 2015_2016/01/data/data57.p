set terminal png
set output "plots/data57.png"
plot "search/data57.csv" using 1:2 with linespoints
