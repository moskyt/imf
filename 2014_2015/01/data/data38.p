set terminal png
set output "plots/data38.png"
plot "search/data38.csv" using 1:2 with linespoints
