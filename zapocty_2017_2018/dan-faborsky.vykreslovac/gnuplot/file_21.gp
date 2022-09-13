set terminal png size 1920,1080
set xlabel "time signal"
set ylabel ""
set title "file_21"
set key outside
set output "charts/file_21.png"
plot "gnuplot/file_21.txt" using 1:2 title 'y1', "gnuplot/file_21.txt" using 1:3 title 'y2', "gnuplot/file_21.txt" using 1:4 title 'y3', "gnuplot/file_21.txt" using 1:5 title 'y4'