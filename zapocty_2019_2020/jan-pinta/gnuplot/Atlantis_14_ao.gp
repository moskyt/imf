set terminal png
set datafile separator ";"
set xdata time
set timefmt "%m/%d/%Y"
set xrange ["05/20/1998":"03/26/2000"]
set xtics "05/20/1998", 11664000, "03/26/2000"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Axiální ofset"
set output "graphs/Atlantis_14_ao.png"
plot "data/data43.csv" using 1:2 with points pointtype 1 lt rgb "red" notitle
