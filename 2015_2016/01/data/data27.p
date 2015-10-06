set terminal png
set output "plots/data27.png"
plot "search/data27.csv" using 1:2 with linespoints
