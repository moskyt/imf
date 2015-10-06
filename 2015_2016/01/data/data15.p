set terminal png
set output "plots/data15.png"
plot "search/data15.csv" using 1:2 with linespoints
