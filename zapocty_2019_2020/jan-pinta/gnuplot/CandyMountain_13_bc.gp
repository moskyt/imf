set terminal png
set datafile separator ";"
set xdata time
set timefmt "%m/%d/%Y"
set xrange ["05/05/1985":"11/22/1986"]
set xtics "05/05/1985", 9763200, "11/22/1986"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/CandyMountain_13_bc.png"
plot "data/data40.csv" using 1:4 with points pointtype 1 lt rgb "green" notitle
