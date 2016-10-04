set terminal png
set output "plots/data46.png"
plot "search/data46.csv" using 1:2 with linespoints
