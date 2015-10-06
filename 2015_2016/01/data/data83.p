set terminal png
set output "plots/data83.png"
plot "search/data83.csv" using 1:2 with linespoints
