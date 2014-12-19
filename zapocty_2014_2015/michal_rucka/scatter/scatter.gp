set terminal png size 1024,768
set output 'scatter/scatter.png'
set xlabel 'Doba pobytu [s]'
set xrange [0:144560]
set ylabel 'Celkova aktivita [-]'
set yrange [0:1.4046259269619399]
set title 'Zavislost celkove aktivity vzorku na dobe pobytu v laboratori'
plot 'scatter/scatter.csv' using 1:2 notitle
