set terminal png
set datafile separator ";"
set xdata time
set timefmt "%Y-%m-%d"
set xrange ["1980-03-18":"1982-01-15"]
set xtics "1980-03-18", 11491200, "1982-01-15"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Pokazetový koeficient nevyrovnání výkonu"
set output "graphs/Disneyland_12_fha.png"
plot "data/data33.csv" using 1:3 with points pointtype 1 lt rgb "blue" notitle
