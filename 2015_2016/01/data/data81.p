set terminal png
set output "plots/data81.png"
plot "search/data81.csv" using 1:2 with linespoints
