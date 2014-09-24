set terminal png
set output "plots/data48.png"
plot "search/data48.csv" using 1:2 with linespoints
