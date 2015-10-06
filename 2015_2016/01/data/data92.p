set terminal png
set output "plots/data92.png"
plot "search/data92.csv" using 1:2 with linespoints
