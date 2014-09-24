set terminal png
set output "plots/data52.png"
plot "search/data52.csv" using 1:2 with linespoints
