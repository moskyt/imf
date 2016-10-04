set terminal png
set output "plots/data16.png"
plot "search/data16.csv" using 1:2 with linespoints
