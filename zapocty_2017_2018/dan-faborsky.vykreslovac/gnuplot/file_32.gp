set terminal png size 1920,1080
set xlabel "time"
set ylabel "intensity"
set title "detector calibration 28. 11. 2015"
set key outside
set output "charts/file_32.png"
plot "gnuplot/file_32.txt" using 1:2 title 'y1', "gnuplot/file_32.txt" using 1:3 title 'y2', "gnuplot/file_32.txt" using 1:4 title 'y3', "gnuplot/file_32.txt" using 1:5 title 'y4'