set terminal png
set datafile separator ";"
set xdata time
set timefmt "%d.%m.%Y"
set xrange ["25.4.1996":"25.2.1998"]
set xtics "25.4.1996", 11577600, "25.2.1998"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/CandyMountain_06_bc.png"
plot "data/data17.csv" using 1:3 with points pointtype 1 lt rgb "green" notitle
