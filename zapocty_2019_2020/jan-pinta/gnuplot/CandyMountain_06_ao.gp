set terminal png
set datafile separator ";"
set xdata time
set timefmt "%d.%m.%Y"
set xrange ["25.4.1996":"25.2.1998"]
set xtics "25.4.1996", 11577600, "25.2.1998"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Axiální ofset"
set output "graphs/CandyMountain_06_ao.png"
plot "data/data17.csv" using 1:2 with points pointtype 1 lt rgb "red" notitle
