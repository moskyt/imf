set terminal png
set output 'vystupy_gnuplot/assembly_081.png'
set title 'Assembly ID A048248 '
set ylabel 'Signal intensity [n/cm]'
set xlabel 'Axial coordinate [cm]'
y1 = NaN 
plot 'data_gnuplot/data_081.txt' with steps notitle, '' u 1:2 w p pt 7 lc rgb "blue" notitle, '' u 1:(y0=y1,y1=$2,y0) w p pt 7 lc rgb "blue" notitle
