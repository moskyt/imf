set terminal png
set datafile separator ";"
set xdata time
set timefmt "%d.%m.%Y"
set xrange ["24.7.1980":"8.2.1982"]
set xtics "24.7.1980", 9763200, "8.2.1982"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Pokazetový koeficient nevyrovnání výkonu"
set output "graphs/CandyMountain_12_fha.png"
plot "data/data39.csv" using 1:2 with points pointtype 1 lt rgb "blue" notitle
