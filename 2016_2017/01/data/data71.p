set terminal png
set output "plots/data71.png"
plot "search/data71.csv" using 1:2 with linespoints
