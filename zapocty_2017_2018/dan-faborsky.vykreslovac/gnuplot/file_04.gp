set terminal png size 1920,1080
set xlabel "time signal"
set ylabel ""
set title "secret experiment #5171"
set key outside
set output "charts/file_04.png"
plot "gnuplot/file_04.txt" using 1:2 title 'y1', "gnuplot/file_04.txt" using 1:3 title 'y2', "gnuplot/file_04.txt" using 1:4 title 'y3', "gnuplot/file_04.txt" using 1:5 title 'y4', "gnuplot/file_04.txt" using 1:6 title 'y5'