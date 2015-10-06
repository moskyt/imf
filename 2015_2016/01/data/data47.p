set terminal png
set output "plots/data47.png"
plot "search/data47.csv" using 1:2 with linespoints
