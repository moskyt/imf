set terminal png
set datafile separator ";"
set xdata time
set timefmt "%m/%d/%Y"
set xrange ["08/03/1986":"04/09/1988"]
set xtics "08/03/1986", 10627200, "04/09/1988"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Axiální ofset"
set output "graphs/Disneyland_15_ao.png"
plot "data/data41.csv" using 1:2 with points pointtype 1 lt rgb "red" notitle
