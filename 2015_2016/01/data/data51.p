set terminal png
set output "plots/data51.png"
plot "search/data51.csv" using 1:2 with linespoints
