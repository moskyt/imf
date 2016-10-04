set terminal png
set output "plots/data10.png"
plot "search/data10.csv" using 1:2 with linespoints
