set terminal png size 1920,1080
set xlabel "time signal"
set ylabel ""
set title "file_30"
set key outside
set output "charts/file_30.png"
plot "gnuplot/file_30.txt" using 1:2 title 'y1', "gnuplot/file_30.txt" using 1:3 title 'y2'