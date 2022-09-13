set terminal png
set datafile separator ";"
set xdata time
set timefmt "%d.%m.%Y"
set xrange ["23.5.1991":"12.12.1992"]
set xtics "23.5.1991", 9849600, "12.12.1992"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Axiální ofset"
set output "graphs/Disneyland_16_ao.png"
plot "data/data46.csv" using 1:2 with points pointtype 1 lt rgb "red" notitle
