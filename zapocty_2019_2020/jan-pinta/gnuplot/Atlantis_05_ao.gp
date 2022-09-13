set terminal png
set datafile separator ";"
set xdata time
set timefmt "%m/%d/%Y"
set xrange ["02/18/1992":"10/09/1993"]
set xtics "02/18/1992", 10368000, "10/09/1993"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Axiální ofset"
set output "graphs/Atlantis_05_ao.png"
plot "data/data14.csv" using 1:3 with points pointtype 1 lt rgb "red" notitle
