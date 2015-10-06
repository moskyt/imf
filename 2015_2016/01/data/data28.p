set terminal png
set output "plots/data28.png"
plot "search/data28.csv" using 1:2 with linespoints
