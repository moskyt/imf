set terminal png
set output "plots/data29.png"
plot "search/data29.csv" using 1:2 with linespoints
