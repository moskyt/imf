set terminal png
set datafile separator ";"
set xdata time
set timefmt "%Y-%m-%d"
set xrange ["1994-09-18":"1996-03-17"]
set xtics "1994-09-18", 9417600, "1996-03-17"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/CandyMountain_09_bc.png"
plot "data/data24.csv" using 1:4 with points pointtype 1 lt rgb "green" notitle