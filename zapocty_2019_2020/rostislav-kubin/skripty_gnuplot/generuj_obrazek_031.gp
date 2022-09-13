set terminal png
set title 'Assembly ID A079711'
set key autotitle columnhead
set xlabel 'axial coordinate [cm]'
set ylabel 'signal intensity [n/cm]'
set output "output/assembly_031.png"
y1=NaN
plot  'data_gnuplot/031.txt' with steps notitle, '' u 1:2 w p pt 7 lc rgb "red" notitle, '' u 1:(y0=y1,y1=$2,y0) w p pt 7 lc rgb "red" notitle
