set terminal png
set output "plots/data100.png"
plot "search/data100.csv" using 1:2 with linespoints
