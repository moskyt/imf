set terminal png
set output "plots/data89.png"
plot "search/data89.csv" using 1:2 with linespoints
