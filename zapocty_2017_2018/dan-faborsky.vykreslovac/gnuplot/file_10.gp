set terminal png size 1920,1080
set xlabel "time"
set ylabel "intensity"
set title "secret experiment #5031"
set key outside
set output "charts/file_10.png"
plot "gnuplot/file_10.txt" using 1:2 title 'y1', "gnuplot/file_10.txt" using 1:3 title 'y2'