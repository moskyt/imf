set terminal png
set output "plots/data23.png"
plot "search/data23.csv" using 1:2 with linespoints
