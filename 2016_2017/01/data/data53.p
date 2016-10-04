set terminal png
set output "plots/data53.png"
plot "search/data53.csv" using 1:2 with linespoints
