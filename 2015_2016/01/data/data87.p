set terminal png
set output "plots/data87.png"
plot "search/data87.csv" using 1:2 with linespoints
