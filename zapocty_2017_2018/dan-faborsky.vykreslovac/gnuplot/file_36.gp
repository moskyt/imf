set terminal png size 1920,1080
set xlabel "time signal"
set ylabel "intensity"
set title "secret experiment #4647"
set key outside
set output "charts/file_36.png"
plot "gnuplot/file_36.txt" using 1:2 title 'y1', "gnuplot/file_36.txt" using 1:3 title 'y2'