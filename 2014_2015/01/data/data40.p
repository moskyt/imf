set terminal png
set output "plots/data40.png"
plot "search/data40.csv" using 1:2 with linespoints
