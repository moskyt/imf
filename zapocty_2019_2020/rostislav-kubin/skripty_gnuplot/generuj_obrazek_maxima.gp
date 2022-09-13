set terminal png
set title 'Maximum'
set key outside
set key autotitle columnhead
set xlabel 'axial coordinate [cm]'
set ylabel 'signal intensity [n/cm]'
set output "output/maximum.png"
plot 'data_gnuplot/038.txt' with steps, 'data_gnuplot/029.txt' with steps,'data_gnuplot/078.txt' with steps,'data_gnuplot/075.txt' with steps,'data_gnuplot/035.txt' with steps
