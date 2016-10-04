set terminal png
set output "plots/data78.png"
plot "search/data78.csv" using 1:2 with linespoints
