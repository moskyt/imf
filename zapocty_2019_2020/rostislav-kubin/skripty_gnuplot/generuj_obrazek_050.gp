set terminal png
set title 'Assembly ID A047739'
set key autotitle columnhead
set xlabel 'axial coordinate [cm]'
set ylabel 'signal intensity [n/cm]'
set output "output/assembly_050.png"
y1=NaN
plot  'data_gnuplot/050.txt' with steps notitle, '' u 1:2 w p pt 7 lc rgb "red" notitle, '' u 1:(y0=y1,y1=$2,y0) w p pt 7 lc rgb "red" notitle
