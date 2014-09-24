set terminal png
set output "plots/data39.png"
plot "search/data39.csv" using 1:2 with linespoints
