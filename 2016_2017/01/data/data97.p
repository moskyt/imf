set terminal png
set output "plots/data97.png"
plot "search/data97.csv" using 1:2 with linespoints
