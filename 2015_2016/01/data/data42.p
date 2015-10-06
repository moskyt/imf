set terminal png
set output "plots/data42.png"
plot "search/data42.csv" using 1:2 with linespoints
