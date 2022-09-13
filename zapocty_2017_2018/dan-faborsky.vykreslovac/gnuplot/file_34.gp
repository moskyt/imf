set terminal png size 1920,1080
set xlabel "time signal"
set ylabel "intensity"
set title "secret experiment #5834"
set key outside
set output "charts/file_34.png"
plot "gnuplot/file_34.txt" using 1:2 title 'y1', "gnuplot/file_34.txt" using 1:3 title 'y2', "gnuplot/file_34.txt" using 1:4 title 'y3'