set terminal png size 1920,1080
set xlabel "time"
set ylabel "signal strength"
set title "detector calibration 19. 10. 2015"
set key outside
set output "charts/file_41.png"
plot "gnuplot/file_41.txt" using 1:2 title 'y1', "gnuplot/file_41.txt" using 1:3 title 'y2'