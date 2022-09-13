set terminal png
set datafile separator ";"
set xdata time
set timefmt "%m/%d/%Y"
set xrange ["05/05/1985":"11/22/1986"]
set xtics "05/05/1985", 9763200, "11/22/1986"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Axiální ofset"
set output "graphs/CandyMountain_13_ao.png"
plot "data/data40.csv" using 1:3 with points pointtype 1 lt rgb "red" notitle
