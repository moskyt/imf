set terminal png
set datafile separator ";"
set xdata time
set timefmt "%d.%m.%Y"
set xrange ["18.9.1985":"4.4.1987"]
set xtics "18.9.1985", 9676800, "4.4.1987"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Pokazetový koeficient nevyrovnání výkonu"
set output "graphs/CandyMountain_03_fha.png"
plot "data/data7.csv" using 1:2 with points pointtype 1 lt rgb "blue" notitle
