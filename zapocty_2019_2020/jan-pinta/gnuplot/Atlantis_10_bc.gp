set terminal png
set datafile separator ";"
set xdata time
set timefmt "%Y-%m-%d"
set xrange ["1982-12-11":"1984-10-27"]
set xtics "1982-12-11", 11836800, "1984-10-27"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/Atlantis_10_bc.png"
plot "data/data30.csv" using 1:3 with points pointtype 1 lt rgb "green" notitle
