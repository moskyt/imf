set terminal png size 1920,1080
set xlabel "time"
set ylabel ""
set title "file_18"
set key outside
set output "charts/file_18.png"
plot "gnuplot/file_18.txt" using 1:2 title 'y1', "gnuplot/file_18.txt" using 1:3 title 'y2', "gnuplot/file_18.txt" using 1:4 title 'y3', "gnuplot/file_18.txt" using 1:5 title 'y4'