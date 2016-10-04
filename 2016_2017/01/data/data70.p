set terminal png
set output "plots/data70.png"
plot "search/data70.csv" using 1:2 with linespoints
