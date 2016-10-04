set terminal png
set output "plots/data44.png"
plot "search/data44.csv" using 1:2 with linespoints
