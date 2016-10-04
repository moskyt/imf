set terminal png
set output "plots/data5.png"
plot "search/data5.csv" using 1:2 with linespoints
