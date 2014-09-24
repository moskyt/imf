set terminal png
set output "plots/data18.png"
plot "search/data18.csv" using 1:2 with linespoints
