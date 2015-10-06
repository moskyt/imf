set terminal png
set output "plots/data14.png"
plot "search/data14.csv" using 1:2 with linespoints
