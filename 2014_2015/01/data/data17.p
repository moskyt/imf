set terminal png
set output "plots/data17.png"
plot "search/data17.csv" using 1:2 with linespoints
