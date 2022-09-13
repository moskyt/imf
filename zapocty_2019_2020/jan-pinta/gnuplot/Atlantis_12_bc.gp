set terminal png
set datafile separator ";"
set xdata time
set timefmt "%d.%m.%Y"
set xrange ["19.4.1992":"21.11.1993"]
set xtics "19.4.1992", 10022400, "21.11.1993"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/Atlantis_12_bc.png"
plot "data/data34.csv" using 1:2 with points pointtype 1 lt rgb "green" notitle
