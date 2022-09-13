set terminal png
set datafile separator ";"
set xdata time
set timefmt "%Y-%m-%d"
set xrange ["1994-10-19":"1996-09-06"]
set xtics "1994-10-19", 11836800, "1996-09-06"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/Atlantis_16_bc.png"
plot "data/data45.csv" using 1:4 with points pointtype 1 lt rgb "green" notitle
