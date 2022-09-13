set terminal png
set datafile separator ";"
set xdata time
set timefmt "%d.%m.%Y"
set xrange ["19.4.1992":"21.11.1993"]
set xtics "19.4.1992", 10022400, "21.11.1993"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Axiální ofset"
set output "graphs/Atlantis_12_ao.png"
plot "data/data34.csv" using 1:4 with points pointtype 1 lt rgb "red" notitle
