set terminal png
set output "plots/data2.png"
plot "search/data2.csv" using 1:2 with linespoints
