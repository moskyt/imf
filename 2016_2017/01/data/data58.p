set terminal png
set output "plots/data58.png"
plot "search/data58.csv" using 1:2 with linespoints
