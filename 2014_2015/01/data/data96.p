set terminal png
set output "plots/data96.png"
plot "search/data96.csv" using 1:2 with linespoints
