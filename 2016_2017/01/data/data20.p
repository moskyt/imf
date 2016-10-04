set terminal png
set output "plots/data20.png"
plot "search/data20.csv" using 1:2 with linespoints
