set terminal png
set output "plots/data62.png"
plot "search/data62.csv" using 1:2 with linespoints
