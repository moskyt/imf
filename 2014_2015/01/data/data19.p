set terminal png
set output "plots/data19.png"
plot "search/data19.csv" using 1:2 with linespoints
