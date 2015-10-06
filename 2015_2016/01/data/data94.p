set terminal png
set output "plots/data94.png"
plot "search/data94.csv" using 1:2 with linespoints
