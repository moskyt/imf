set terminal png
set output "plots/data25.png"
plot "search/data25.csv" using 1:2 with linespoints
