set terminal png size 1920,1080
set xlabel "time"
set ylabel "signal strength"
set title "file_05"
set key outside
set output "charts/file_05.png"
plot "gnuplot/file_05.txt" using 1:2 title 'y1', "gnuplot/file_05.txt" using 1:3 title 'y2'