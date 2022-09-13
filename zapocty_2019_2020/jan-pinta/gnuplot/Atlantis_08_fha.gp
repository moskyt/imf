set terminal png
set datafile separator ";"
set xdata time
set timefmt "%m/%d/%Y"
set xrange ["09/24/1991":"06/30/1993"]
set xtics "09/24/1991", 11145600, "06/30/1993"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Pokazetový koeficient nevyrovnání výkonu"
set output "graphs/Atlantis_08_fha.png"
plot "data/data25.csv" using 1:2 with points pointtype 1 lt rgb "blue" notitle
