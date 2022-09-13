set terminal png
set datafile separator ";"
set xdata time
set timefmt "%d.%m.%Y"
set xrange ["23.5.1991":"12.12.1992"]
set xtics "23.5.1991", 9849600, "12.12.1992"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/Disneyland_16_bc.png"
plot "data/data46.csv" using 1:3 with points pointtype 1 lt rgb "green" notitle
