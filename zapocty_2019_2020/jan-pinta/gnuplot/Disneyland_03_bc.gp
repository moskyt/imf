set terminal png
set datafile separator ";"
set xdata time
set timefmt "%d.%m.%Y"
set xrange ["8.10.1988":"15.5.1990"]
set xtics "8.10.1988", 10108800, "15.5.1990"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/Disneyland_03_bc.png"
plot "data/data11.csv" using 1:2 with points pointtype 1 lt rgb "green" notitle
