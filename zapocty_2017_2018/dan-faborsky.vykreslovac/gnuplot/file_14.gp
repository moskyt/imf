set terminal png size 1920,1080
set xlabel "time signal"
set ylabel "signal strength"
set title "secret experiment #3704"
set key outside
set output "charts/file_14.png"
plot "gnuplot/file_14.txt" using 1:2 title 'y1'