set terminal png
set datafile separator ";"
set xdata time
set timefmt "%Y-%m-%d"
set xrange ["1991-01-16":"1992-10-27"]
set xtics "1991-01-16", 11232000, "1992-10-27"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Axiální ofset"
set output "graphs/Atlantis_04_ao.png"
plot "data/data8.csv" using 1:3 with points pointtype 1 lt rgb "red" notitle
