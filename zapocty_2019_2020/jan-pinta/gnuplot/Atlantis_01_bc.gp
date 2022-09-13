set terminal png
set datafile separator ";"
set xdata time
set timefmt "%d.%m.%Y"
set xrange ["9.12.1983":"13.9.1985"]
set xtics "9.12.1983", 11145600, "13.9.1985"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/Atlantis_01_bc.png"
plot "data/data1.csv" using 1:3 with points pointtype 1 lt rgb "green" notitle
