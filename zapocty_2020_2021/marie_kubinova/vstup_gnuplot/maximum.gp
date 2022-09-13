set terminal png
set output 'vystupy_gnuplot/maximum.png'
set title 'Maximum'
set ylabel 'Signal intensity [n/cm]'
set xlabel 'Axial coordinate [cm]'
set key outside
plot 'data_gnuplot/data_038.txt' with steps title "A086696", 'data_gnuplot/data_029.txt' with steps title "A065672",'data_gnuplot/data_078.txt' with steps title "A045825",'data_gnuplot/data_075.txt' with steps title "A095778",'data_gnuplot/data_035.txt' with steps title "A091031"
