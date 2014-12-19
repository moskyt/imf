set terminal png size 1024,768
set boxwidth 0.5 relative
set style fill solid 0.5 noborder
set output 'histogram/histogram.png'
set xlabel 'Doba pobytu [s]'
set xrange [0:144560]
set ylabel 'Pocet vzorku [-]'
set yrange [0:1071]
set title 'Histogram doby pobytu vzorku v laboratori'
plot 'histogram/histogram.csv' using 1:2 with boxes lc rgb'green' notitle
