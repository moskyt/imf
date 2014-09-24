set terminal png
set output "plots/data73.png"
plot "search/data73.csv" using 1:2 with linespoints
