set terminal png
set output "plots/data66.png"
plot "search/data66.csv" using 1:2 with linespoints
