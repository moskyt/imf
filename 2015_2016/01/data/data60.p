set terminal png
set output "plots/data60.png"
plot "search/data60.csv" using 1:2 with linespoints
