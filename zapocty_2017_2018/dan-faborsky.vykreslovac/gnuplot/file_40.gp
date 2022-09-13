set terminal png size 1920,1080
set xlabel "time"
set ylabel "intensity"
set title "secret experiment #1241"
set key outside
set output "charts/file_40.png"
plot "gnuplot/file_40.txt" using 1:2 title 'y1'