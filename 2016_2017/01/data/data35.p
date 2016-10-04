set terminal png
set output "plots/data35.png"
plot "search/data35.csv" using 1:2 with linespoints
