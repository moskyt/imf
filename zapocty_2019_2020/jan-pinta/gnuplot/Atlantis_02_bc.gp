set terminal png
set datafile separator ";"
set xdata time
set timefmt "%d.%m.%Y"
set xrange ["12.7.1988":"14.2.1990"]
set xtics "12.7.1988", 10022400, "14.2.1990"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/Atlantis_02_bc.png"
plot "data/data2.csv" using 1:4 with points pointtype 1 lt rgb "green" notitle
