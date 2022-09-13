set terminal png
set datafile separator ";"
set xdata time
set timefmt "%d.%m.%Y"
set xrange ["10.1.1993":"22.6.1994"]
set xtics "10.1.1993", 9072000, "22.6.1994"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/CandyMountain_15_bc.png"
plot "data/data47.csv" using 1:3 with points pointtype 1 lt rgb "green" notitle
