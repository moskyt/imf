set terminal png
set output "plots/data9.png"
plot "search/data9.csv" using 1:2 with linespoints
