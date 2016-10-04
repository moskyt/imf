set terminal png
set output "plots/data37.png"
plot "search/data37.csv" using 1:2 with linespoints
