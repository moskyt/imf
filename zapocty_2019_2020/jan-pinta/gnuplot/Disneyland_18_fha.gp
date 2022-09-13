set terminal png
set datafile separator ";"
set xdata time
set timefmt "%m/%d/%Y"
set xrange ["11/13/1981":"08/10/1983"]
set xtics "11/13/1981", 10972800, "08/10/1983"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Pokazetový koeficient nevyrovnání výkonu"
set output "graphs/Disneyland_18_fha.png"
plot "data/data50.csv" using 1:4 with points pointtype 1 lt rgb "blue" notitle
