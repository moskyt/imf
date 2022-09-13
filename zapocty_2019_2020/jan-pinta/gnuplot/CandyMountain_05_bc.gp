set terminal png
set datafile separator ";"
set xdata time
set timefmt "%Y-%m-%d"
set xrange ["1993-01-23":"1994-09-29"]
set xtics "1993-01-23", 10627200, "1994-09-29"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/CandyMountain_05_bc.png"
plot "data/data16.csv" using 1:2 with points pointtype 1 lt rgb "green" notitle
