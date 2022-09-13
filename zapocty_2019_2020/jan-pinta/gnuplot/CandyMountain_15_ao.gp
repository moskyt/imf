set terminal png
set datafile separator ";"
set xdata time
set timefmt "%d.%m.%Y"
set xrange ["10.1.1993":"22.6.1994"]
set xtics "10.1.1993", 9072000, "22.6.1994"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Axiální ofset"
set output "graphs/CandyMountain_15_ao.png"
plot "data/data47.csv" using 1:2 with points pointtype 1 lt rgb "red" notitle
