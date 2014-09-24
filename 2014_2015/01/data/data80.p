set terminal png
set output "plots/data80.png"
plot "search/data80.csv" using 1:2 with linespoints
