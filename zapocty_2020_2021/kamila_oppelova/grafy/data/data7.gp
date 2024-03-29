set terminal png
set xdata time
set grid
set xtics rotate by 45 right
set timefmt "%d.%m.%Y"
set xlabel 'Datum'
set ylabel 'Hodnoty'
set title "CandyMountain NPP, unit 3"
set output "grafy/CandyMountain03.png"
plot  'grafy/data/data7.txt' using 1:2 title "Boritá [g/kg]", 'grafy/data/data7.txt' using 1:3 title "AO [%]" , 'grafy/data/data7.txt' using 1:4 title "fha [%]"
