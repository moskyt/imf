set terminal png
set datafile separator ";"
set xdata time
set timefmt "%d.%m.%Y"
set xrange ["9.12.1983":"13.9.1985"]
set xtics "9.12.1983", 11145600, "13.9.1985"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Pokazetový koeficient nevyrovnání výkonu"
set output "graphs/Atlantis_01_fha.png"
plot "data/data1.csv" using 1:2 with points pointtype 1 lt rgb "blue" notitle
