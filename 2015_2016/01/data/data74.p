set terminal png
set output "plots/data74.png"
plot "search/data74.csv" using 1:2 with linespoints
