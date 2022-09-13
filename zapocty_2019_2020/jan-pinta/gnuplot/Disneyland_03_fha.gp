set terminal png
set datafile separator ";"
set xdata time
set timefmt "%d.%m.%Y"
set xrange ["8.10.1988":"15.5.1990"]
set xtics "8.10.1988", 10108800, "15.5.1990"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Pokazetový koeficient nevyrovnání výkonu"
set output "graphs/Disneyland_03_fha.png"
plot "data/data11.csv" using 1:4 with points pointtype 1 lt rgb "blue" notitle
