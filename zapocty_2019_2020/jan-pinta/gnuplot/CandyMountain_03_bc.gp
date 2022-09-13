set terminal png
set datafile separator ";"
set xdata time
set timefmt "%d.%m.%Y"
set xrange ["18.9.1985":"4.4.1987"]
set xtics "18.9.1985", 9676800, "4.4.1987"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/CandyMountain_03_bc.png"
plot "data/data7.csv" using 1:4 with points pointtype 1 lt rgb "green" notitle
