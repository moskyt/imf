set terminal png
set output "plots/data11.png"
plot "search/data11.csv" using 1:2 with linespoints
