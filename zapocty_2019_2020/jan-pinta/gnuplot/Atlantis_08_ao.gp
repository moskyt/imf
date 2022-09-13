set terminal png
set datafile separator ";"
set xdata time
set timefmt "%m/%d/%Y"
set xrange ["09/24/1991":"06/30/1993"]
set xtics "09/24/1991", 11145600, "06/30/1993"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Axiální ofset"
set output "graphs/Atlantis_08_ao.png"
plot "data/data25.csv" using 1:3 with points pointtype 1 lt rgb "red" notitle
