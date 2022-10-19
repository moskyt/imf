set terminal png
set datafile separator ";"
set xdata time
set timefmt "%m/%d/%Y"
set xrange ["06/21/1997":"03/28/1999"]
set xtics "06/21/1997", 11145600, "03/28/1999"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Axiální ofset"
set output "graphs/Disneyland_02_ao.png"
plot "data/data9.csv" using 1:3 with points pointtype 1 lt rgb "red" notitle