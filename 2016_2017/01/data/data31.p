set terminal png
set output "plots/data31.png"
plot "search/data31.csv" using 1:2 with linespoints
