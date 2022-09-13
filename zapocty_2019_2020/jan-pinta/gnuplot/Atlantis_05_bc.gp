set terminal png
set datafile separator ";"
set xdata time
set timefmt "%m/%d/%Y"
set xrange ["02/18/1992":"10/09/1993"]
set xtics "02/18/1992", 10368000, "10/09/1993"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/Atlantis_05_bc.png"
plot "data/data14.csv" using 1:2 with points pointtype 1 lt rgb "green" notitle
