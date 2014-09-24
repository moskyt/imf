set terminal png
set output "plots/data30.png"
plot "search/data30.csv" using 1:2 with linespoints
