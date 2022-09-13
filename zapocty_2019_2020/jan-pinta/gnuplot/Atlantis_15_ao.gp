set terminal png
set datafile separator ";"
set xdata time
set timefmt "%Y-%m-%d"
set xrange ["1999-02-08":"2000-07-10"]
set xtics "1999-02-08", 8899200, "2000-07-10"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Axiální ofset"
set output "graphs/Atlantis_15_ao.png"
plot "data/data44.csv" using 1:2 with points pointtype 1 lt rgb "red" notitle
