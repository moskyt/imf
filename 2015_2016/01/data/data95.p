set terminal png
set output "plots/data95.png"
plot "search/data95.csv" using 1:2 with linespoints
