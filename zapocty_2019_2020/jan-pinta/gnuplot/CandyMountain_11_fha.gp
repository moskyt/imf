set terminal png
set datafile separator ";"
set xdata time
set timefmt "%d.%m.%Y"
set xrange ["1.12.1986":"19.4.1988"]
set xtics "1.12.1986", 8726400, "19.4.1988"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Pokazetový koeficient nevyrovnání výkonu"
set output "graphs/CandyMountain_11_fha.png"
plot "data/data37.csv" using 1:4 with points pointtype 1 lt rgb "blue" notitle
