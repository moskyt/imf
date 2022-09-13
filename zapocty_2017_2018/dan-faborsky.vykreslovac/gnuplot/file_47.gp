set terminal png size 1920,1080
set xlabel "time"
set ylabel "intensity"
set title "secret experiment #2903"
set key outside
set output "charts/file_47.png"
plot "gnuplot/file_47.txt" using 1:2 title 'y1', "gnuplot/file_47.txt" using 1:3 title 'y2', "gnuplot/file_47.txt" using 1:4 title 'y3'