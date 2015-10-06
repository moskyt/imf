set terminal png
set output "plots/data68.png"
plot "search/data68.csv" using 1:2 with linespoints
