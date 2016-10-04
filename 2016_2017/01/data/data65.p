set terminal png
set output "plots/data65.png"
plot "search/data65.csv" using 1:2 with linespoints
