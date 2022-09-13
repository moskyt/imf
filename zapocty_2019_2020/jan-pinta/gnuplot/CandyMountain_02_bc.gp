set terminal png
set datafile separator ";"
set xdata time
set timefmt "%Y-%m-%d"
set xrange ["1995-05-06":"1996-12-29"]
set xtics "1995-05-06", 10368000, "1996-12-29"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/CandyMountain_02_bc.png"
plot "data/data5.csv" using 1:2 with points pointtype 1 lt rgb "green" notitle
