set terminal png size 1920,1080
set xlabel "time signal"
set ylabel ""
set title "secret experiment #4070"
set key outside
set output "charts/file_01.png"
plot "gnuplot/file_01.txt" using 1:2 title 'y1'