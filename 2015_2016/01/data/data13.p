set terminal png
set output "plots/data13.png"
plot "search/data13.csv" using 1:2 with linespoints
