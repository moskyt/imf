set terminal png
set datafile separator ";"
set xdata time
set timefmt "%d.%m.%Y"
set xrange ["12.8.1986":"9.1.1988"]
set xtics "12.8.1986", 8899200, "9.1.1988"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Axiální ofset"
set output "graphs/CandyMountain_14_ao.png"
plot "data/data42.csv" using 1:4 with points pointtype 1 lt rgb "red" notitle
