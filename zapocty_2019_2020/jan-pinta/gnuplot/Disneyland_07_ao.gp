set terminal png
set datafile separator ";"
set xdata time
set timefmt "%Y-%m-%d"
set xrange ["1990-01-25":"1991-08-25"]
set xtics "1990-01-25", 9936000, "1991-08-25"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Axiální ofset"
set output "graphs/Disneyland_07_ao.png"
plot "data/data19.csv" using 1:2 with points pointtype 1 lt rgb "red" notitle
