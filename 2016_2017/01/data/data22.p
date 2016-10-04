set terminal png
set output "plots/data22.png"
plot "search/data22.csv" using 1:2 with linespoints
