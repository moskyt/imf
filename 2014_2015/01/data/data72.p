set terminal png
set output "plots/data72.png"
plot "search/data72.csv" using 1:2 with linespoints
