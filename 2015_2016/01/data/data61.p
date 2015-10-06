set terminal png
set output "plots/data61.png"
plot "search/data61.csv" using 1:2 with linespoints
