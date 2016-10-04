set terminal png
set output "plots/data56.png"
plot "search/data56.csv" using 1:2 with linespoints
