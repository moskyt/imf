set terminal png
set output "plots/data6.png"
plot "search/data6.csv" using 1:2 with linespoints
