set terminal png size 1920,1080
set xlabel "time signal"
set ylabel "signal strength"
set title "secret experiment #4686"
set key outside
set output "charts/file_44.png"
plot "gnuplot/file_44.txt" using 1:2 title 'y1'