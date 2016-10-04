set terminal png
set output "plots/data34.png"
plot "search/data34.csv" using 1:2 with linespoints
