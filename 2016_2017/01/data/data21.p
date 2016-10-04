set terminal png
set output "plots/data21.png"
plot "search/data21.csv" using 1:2 with linespoints
