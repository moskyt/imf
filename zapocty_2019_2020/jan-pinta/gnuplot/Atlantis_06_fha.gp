set terminal png
set datafile separator ";"
set xdata time
set timefmt "%m/%d/%Y"
set xrange ["03/05/1982":"09/19/1983"]
set xtics "03/05/1982", 9676800, "09/19/1983"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Pokazetový koeficient nevyrovnání výkonu"
set output "graphs/Atlantis_06_fha.png"
plot "data/data15.csv" using 1:4 with points pointtype 1 lt rgb "blue" notitle
