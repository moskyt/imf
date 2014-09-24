set terminal png
set output "plots/data45.png"
plot "search/data45.csv" using 1:2 with linespoints
