set terminal png
set output "plots/data24.png"
plot "search/data24.csv" using 1:2 with linespoints
