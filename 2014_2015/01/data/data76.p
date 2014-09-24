set terminal png
set output "plots/data76.png"
plot "search/data76.csv" using 1:2 with linespoints
