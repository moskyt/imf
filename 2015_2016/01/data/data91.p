set terminal png
set output "plots/data91.png"
plot "search/data91.csv" using 1:2 with linespoints
