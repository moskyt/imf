set terminal png
set output "plots/data26.png"
plot "search/data26.csv" using 1:2 with linespoints
