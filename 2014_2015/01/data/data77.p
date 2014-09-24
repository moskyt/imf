set terminal png
set output "plots/data77.png"
plot "search/data77.csv" using 1:2 with linespoints
