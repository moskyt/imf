set terminal png
set output "plots/data88.png"
plot "search/data88.csv" using 1:2 with linespoints
