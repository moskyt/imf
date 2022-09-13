set terminal png
set datafile separator ";"
set xdata time
set timefmt "%d.%m.%Y"
set xrange ["15.7.1986":"31.3.1988"]
set xtics "15.7.1986", 10800000, "31.3.1988"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Pokazetový koeficient nevyrovnání výkonu"
set output "graphs/Atlantis_13_fha.png"
plot "data/data36.csv" using 1:4 with points pointtype 1 lt rgb "blue" notitle
