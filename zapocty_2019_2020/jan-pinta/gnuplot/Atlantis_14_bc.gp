set terminal png
set datafile separator ";"
set xdata time
set timefmt "%m/%d/%Y"
set xrange ["05/20/1998":"03/26/2000"]
set xtics "05/20/1998", 11664000, "03/26/2000"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/Atlantis_14_bc.png"
plot "data/data43.csv" using 1:4 with points pointtype 1 lt rgb "green" notitle
