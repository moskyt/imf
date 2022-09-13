set terminal png
set datafile separator ";"
set xdata time
set timefmt "%m/%d/%Y"
set xrange ["05/11/1997":"12/27/1998"]
set xtics "05/11/1997", 10281600, "12/27/1998"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Pokazetový koeficient nevyrovnání výkonu"
set output "graphs/CandyMountain_10_fha.png"
plot "data/data28.csv" using 1:3 with points pointtype 1 lt rgb "blue" notitle
