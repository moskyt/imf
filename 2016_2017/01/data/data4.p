set terminal png
set output "plots/data4.png"
plot "search/data4.csv" using 1:2 with linespoints
