set terminal png
set datafile separator ";"
set xdata time
set timefmt "%d.%m.%Y"
set xrange ["25.11.1984":"8.9.1986"]
set xtics "25.11.1984", 11232000, "8.9.1986"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Pokazetový koeficient nevyrovnání výkonu"
set output "graphs/Disneyland_17_fha.png"
plot "data/data49.csv" using 1:2 with points pointtype 1 lt rgb "blue" notitle
