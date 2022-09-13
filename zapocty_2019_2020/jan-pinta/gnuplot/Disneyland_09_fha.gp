set terminal png
set datafile separator ";"
set xdata time
set timefmt "%Y-%m-%d"
set xrange ["1980-01-17":"1981-09-17"]
set xtics "1980-01-17", 10540800, "1981-09-17"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Pokazetový koeficient nevyrovnání výkonu"
set output "graphs/Disneyland_09_fha.png"
plot "data/data26.csv" using 1:4 with points pointtype 1 lt rgb "blue" notitle
