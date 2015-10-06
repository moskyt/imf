set terminal png
set output "plots/data7.png"
plot "search/data7.csv" using 1:2 with linespoints
