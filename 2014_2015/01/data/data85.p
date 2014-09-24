set terminal png
set output "plots/data85.png"
plot "search/data85.csv" using 1:2 with linespoints
