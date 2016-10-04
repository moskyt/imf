set terminal png
set output "plots/data36.png"
plot "search/data36.csv" using 1:2 with linespoints
