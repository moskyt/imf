set terminal png
set datafile separator ";"
set xdata time
set timefmt "%m/%d/%Y"
set xrange ["09/09/1982":"04/21/1984"]
set xtics "09/09/1982", 10195200, "04/21/1984"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Axiální ofset"
set output "graphs/Disneyland_01_ao.png"
plot "data/data3.csv" using 1:3 with points pointtype 1 lt rgb "red" notitle
