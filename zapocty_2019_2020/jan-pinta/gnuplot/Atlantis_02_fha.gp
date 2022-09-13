set terminal png
set datafile separator ";"
set xdata time
set timefmt "%d.%m.%Y"
set xrange ["12.7.1988":"14.2.1990"]
set xtics "12.7.1988", 10022400, "14.2.1990"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Pokazetový koeficient nevyrovnání výkonu"
set output "graphs/Atlantis_02_fha.png"
plot "data/data2.csv" using 1:3 with points pointtype 1 lt rgb "blue" notitle
