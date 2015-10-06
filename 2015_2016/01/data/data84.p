set terminal png
set output "plots/data84.png"
plot "search/data84.csv" using 1:2 with linespoints
