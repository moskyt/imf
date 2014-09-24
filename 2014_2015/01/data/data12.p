set terminal png
set output "plots/data12.png"
plot "search/data12.csv" using 1:2 with linespoints
