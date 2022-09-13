set terminal png
set datafile separator ";"
set xdata time
set timefmt "%d.%m.%Y"
set xrange ["18.9.1985":"4.4.1987"]
set xtics "18.9.1985", 9676800, "4.4.1987"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Axiální ofset"
set output "graphs/CandyMountain_03_ao.png"
plot "data/data7.csv" using 1:3 with points pointtype 1 lt rgb "red" notitle
