set terminal png
set output "plots/data55.png"
plot "search/data55.csv" using 1:2 with linespoints
