set terminal png
set datafile separator ";"
set xdata time
set timefmt "%m/%d/%Y"
set xrange ["07/14/1999":"12/11/2000"]
set xtics "07/14/1999", 8899200, "12/11/2000"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Pokazetový koeficient nevyrovnání výkonu"
set output "graphs/CandyMountain_07_fha.png"
plot "data/data22.csv" using 1:3 with points pointtype 1 lt rgb "blue" notitle
