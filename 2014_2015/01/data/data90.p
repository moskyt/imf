set terminal png
set output "plots/data90.png"
plot "search/data90.csv" using 1:2 with linespoints
