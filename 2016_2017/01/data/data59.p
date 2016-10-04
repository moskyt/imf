set terminal png
set output "plots/data59.png"
plot "search/data59.csv" using 1:2 with linespoints
