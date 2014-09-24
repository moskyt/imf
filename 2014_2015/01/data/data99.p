set terminal png
set output "plots/data99.png"
plot "search/data99.csv" using 1:2 with linespoints
