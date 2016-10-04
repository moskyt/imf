set terminal png
set output "plots/data93.png"
plot "search/data93.csv" using 1:2 with linespoints
