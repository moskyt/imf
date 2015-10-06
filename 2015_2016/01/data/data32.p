set terminal png
set output "plots/data32.png"
plot "search/data32.csv" using 1:2 with linespoints
