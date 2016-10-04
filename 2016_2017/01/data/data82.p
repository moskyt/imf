set terminal png
set output "plots/data82.png"
plot "search/data82.csv" using 1:2 with linespoints
