set terminal png
set datafile separator ";"
set xdata time
set timefmt "%m/%d/%Y"
set xrange ["11/13/1981":"08/10/1983"]
set xtics "11/13/1981", 10972800, "08/10/1983"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Axiální ofset"
set output "graphs/Disneyland_18_ao.png"
plot "data/data50.csv" using 1:3 with points pointtype 1 lt rgb "red" notitle
