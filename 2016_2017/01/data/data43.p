set terminal png
set output "plots/data43.png"
plot "search/data43.csv" using 1:2 with linespoints
