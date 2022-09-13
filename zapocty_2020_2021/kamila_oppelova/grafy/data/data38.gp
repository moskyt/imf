set terminal png
set xdata time
set grid
set xtics rotate by 45 right
set timefmt "%d.%m.%Y"
set xlabel 'Datum'
set ylabel 'Hodnoty'
set title "Disneyland NPP, unit 14"
set output "grafy/Disneyland14.png"
plot  'grafy/data/data38.txt' using 1:2 title "Boritá [g/kg]", 'grafy/data/data38.txt' using 1:3 title "AO [%]" , 'grafy/data/data38.txt' using 1:4 title "fha [%]"
