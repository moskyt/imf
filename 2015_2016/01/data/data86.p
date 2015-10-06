set terminal png
set output "plots/data86.png"
plot "search/data86.csv" using 1:2 with linespoints
