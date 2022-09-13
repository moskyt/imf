set terminal png
set datafile separator ";"
set xdata time
set timefmt "%Y-%m-%d"
set xrange ["1983-08-12":"1985-01-13"]
set xtics "1983-08-12", 8985600, "1985-01-13"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Axiální ofset"
set output "graphs/Disneyland_13_ao.png"
plot "data/data35.csv" using 1:3 with points pointtype 1 lt rgb "red" notitle
