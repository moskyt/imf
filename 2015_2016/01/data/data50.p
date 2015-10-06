set terminal png
set output "plots/data50.png"
plot "search/data50.csv" using 1:2 with linespoints
