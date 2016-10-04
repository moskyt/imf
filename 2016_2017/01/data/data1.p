set terminal png
set output "plots/data1.png"
plot "search/data1.csv" using 1:2 with linespoints
