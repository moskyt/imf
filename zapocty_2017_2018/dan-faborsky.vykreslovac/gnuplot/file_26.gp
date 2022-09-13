set terminal png size 1920,1080
set xlabel "time"
set ylabel "intensity"
set title "detector calibration 11. 03. 2015"
set key outside
set output "charts/file_26.png"
plot "gnuplot/file_26.txt" using 1:2 title 'y1', "gnuplot/file_26.txt" using 1:3 title 'y2'