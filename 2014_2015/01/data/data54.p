set terminal png
set output "plots/data54.png"
plot "search/data54.csv" using 1:2 with linespoints
