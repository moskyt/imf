set terminal png
set output "plots/data67.png"
plot "search/data67.csv" using 1:2 with linespoints
