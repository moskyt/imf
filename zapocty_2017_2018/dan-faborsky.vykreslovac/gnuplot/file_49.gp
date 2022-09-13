set terminal png size 1920,1080
set xlabel "time"
set ylabel "signal strength"
set title "secret experiment #5422"
set key outside
set output "charts/file_49.png"
plot "gnuplot/file_49.txt" using 1:2 title 'y1'