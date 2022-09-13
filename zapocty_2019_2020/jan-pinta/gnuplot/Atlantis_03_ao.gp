set terminal png
set datafile separator ";"
set xdata time
set timefmt "%Y-%m-%d"
set xrange ["1982-01-19":"1983-09-20"]
set xtics "1982-01-19", 10540800, "1983-09-20"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Axiální ofset"
set output "graphs/Atlantis_03_ao.png"
plot "data/data6.csv" using 1:3 with points pointtype 1 lt rgb "red" notitle
